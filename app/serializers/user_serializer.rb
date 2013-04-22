class UserSerializer < BaseSerializer
  attributes :id,
    :authentication_token,
    :email,
    :first_name,
    :last_name,
    :mobile

  def attributes
    hash = super

    image_url_root = "v1/image/#{object.class.to_s.downcase}/#{object.id}"
    hash['image'] = image_url_root

    unless object.image.blank?
      object.image.versions.keys.each do |version|
        hash[version] = image_url_root + "/#{version.to_s}"
      end
    end

    hash
  end
end
