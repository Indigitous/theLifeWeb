# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    Rails.root.join 'uploads',
      model.class.to_s.underscore,
      mounted_as.to_s,
      model.id.to_s
  end

  def cache_dir
    Rails.root.join 'tmp/cache/uploads/',
      model.class.to_s.underscore,
      mounted_as.to_s,
      model.id.to_s
  end

  # Process files as they are uploaded:
  process prepare: [200, 200]

  # Create different versions of your uploaded files:
  version :thumbnail do
    process resize_to_limit: [60, 60]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{secure_token}.jpg" if original_filename.present?
  end

  def url(*args)
    version = args.first.to_s
    args.shift if version == 'original'

    super(*args)
  end

  def version_names
    ['original'] + versions.keys.map(&:to_s)
  end

  private

  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end

  def prepare(width, height)
    manipulate! do |img|
      img.format('jpg') do |o|
        o.resize  "#{width}x#{height}<"
        o.resize  "#{width}x#{height}>"
        o.push    "+profile"
        o.+       "!xmp, *"
      end

      img
    end
  end

end
