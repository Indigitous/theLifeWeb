module ImageAttributes
  def attributes
    add_image_attributes(super)
  end

  def add_image_attributes(attributes)
    attributes['image'] = image_url

    object.image.versions.keys.each do |version|
      attributes[version] = image_url(version)
    end

    attributes
  end

  private

  def image_url(version = nil)
    object.image_url(version).present? ? version_image_url(version) : nil
  end

  def version_image_url(version)
    version.nil? ? base_image_url : [base_image_url, version].join('/')
  end

  def base_image_url
    "v1/image/#{object.class.to_s.downcase.pluralize}/#{object.id}"
  end
end
