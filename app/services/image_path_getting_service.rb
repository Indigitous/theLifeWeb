class ImagePathGettingService
  WHITELISTED_RESOURCES = %w(users friends activities)

  def initialize(user, params)
    @user, @params = user, params
  end

  def get
    resource_is_whitelisted? &&
    get_image_for_resource
  end

  private

  def resource_is_whitelisted?
    WHITELISTED_RESOURCES.include? requested_resource
  end

  def get_image_for_resource
    return resource.image_url(version) if resource.present?

    false
  end

  def resource
    @resource_class ||= requested_resource.singularize.capitalize.constantize
    @resource_class.find_by_id(@params[:id])
  end

  def version
    @params[:version].blank? ? nil : @params[:version]
  end

  def requested_resource
    @params[:resources]
  end
end
