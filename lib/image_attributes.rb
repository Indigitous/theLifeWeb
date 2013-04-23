module ImageAttributes
  def attributes
    add_image_attributes(super)
  end

  def add_image_attributes(attributes)
    if object.image?
      image_url = "v1/image/#{object.class.to_s.downcase.pluralize}/#{object.id}"
      attributes['image'] = image_url

      object.image.versions.keys.each do |version|
        attributes[version] = image_url + "/#{version.to_s}"
      end
    end

    attributes
  end
end
