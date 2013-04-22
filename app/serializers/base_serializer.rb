class BaseSerializer < ActiveModel::Serializer
  embed :ids, include: false

  def image_attributes
    img_attributes = {}

    unless object.image.blank?
      image_url = "v1/image/#{object.class.to_s.downcase.pluralize}/#{object.id}"
      img_attributes['image'] = image_url

      object.image.versions.keys.each do |version|
        img_attributes[version] = image_url + "/#{version.to_s}"
      end
    end

    img_attributes
  end
end
