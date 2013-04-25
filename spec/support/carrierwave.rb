RSpec.configure do |config|
  config.after(:all) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/fixtures/uploads"])
  end

  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?

    klass.class_eval do
      def cache_dir
        Rails.root.join('spec/fixtures/uploads/tmp')
      end

      def store_dir
        Rails.root.join 'spec/fixtures/uploads/',
          model.class.to_s.underscore,
          mounted_as.to_s,
          model.id.to_s
      end
    end
  end
end
