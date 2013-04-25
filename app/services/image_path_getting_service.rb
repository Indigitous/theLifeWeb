class ImagePathGettingService
  delegate :image_url, :image, to: :resource

  def initialize(user, params)
    @user, @params = user, params
  end

  def to_image
    image_url(version) if version_names.include?(version)
  end

  private

  def resource
    if resource_id = @params[:user_id]
      @user.visible_profiles.find(resource_id)

    elsif resource_id = @params[:friend_id]
      @user.friends.find(resource_id)

    elsif resource_id = @params[:activity_id]
      Activity.scoped.find(resource_id)
    end
  end

  def version_names
    image.version_names
  end

  def version
    @params[:version]
  end

  def requested_resource
    @params[:resources]
  end
end
