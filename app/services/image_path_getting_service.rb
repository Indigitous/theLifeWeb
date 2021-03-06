class ImagePathGettingService
  WHITELISTED_RESOURCES = %w(users friends activities)
  PUBLIC_RESOURCES = %w(activities)

  def initialize(user, params)
    @user, @params = user, params
  end

  def get
    resource_is_whitelisted? &&
    user_has_access_to_this_resource? &&
    resource_exists? &&
    requested_version_exists? &&
    get_image_for_resource
  end

  private

  def resource_is_whitelisted?
    WHITELISTED_RESOURCES.include? requested_resources
  end

  def user_has_access_to_this_resource?
    PUBLIC_RESOURCES.include?(requested_resources) ||
    accessible_resource_ids.include?(resource_id.to_i)
  end

  def resource_exists?
    resource.present?
  end

  def requested_version_exists?
    version.blank? || resource.image.versions.has_key?(version.to_sym)
  end

  def get_image_for_resource
    resource.image_url(version)
  end

  def accessible_resource_ids
    case requested_resources
      when 'users' then @user.visible_user_ids
      when 'friends' then @user.visible_friend_ids
    end
  end

  def resource
    @resource ||= resource_class.find_by_id(resource_id)
  end

  def resource_class
    @resource_class ||= requested_resources.classify.constantize
  end

  def resource_id
    @params[:id]
  end

  def version
    @params[:version].presence
  end

  def requested_resources
    @params[:resources]
  end
end
