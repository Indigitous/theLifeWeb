class ImagePathGettingService
  WHITELISTED_RESOURCES = %w(users friends activities)
  PUBLIC_RESOURCES = %w(activities)

  def initialize(user, params)
    @user, @params = user, params
  end

  def get
    resource_is_whitelisted? &&
    user_has_access_to_this_resource? &&
    get_image_for_resource
  end

  private

  def resource_is_whitelisted?
    WHITELISTED_RESOURCES.include? requested_resource
  end

  def user_has_access_to_this_resource?
    return true if PUBLIC_RESOURCES.include?(requested_resource)

    accessible_resource_ids = case requested_resource
      when 'users' then @user.visible_user_ids
      when 'friends' then @user.friend_ids
    end

    accessible_resource_ids.include?(resource_id)
  end

  def get_image_for_resource
    return resource.image_url(version) if resource.present?
  end

  def resource
    @resource_class ||= requested_resource.singularize.capitalize.constantize
    @resource ||= @resource_class.find_by_id(resource_id)
  end

  def resource_id
    @params[:id]
  end

  def version
    @params[:version].blank? ? nil : @params[:version]
  end

  def requested_resource
    @params[:resources]
  end
end
