class ImagePathGettingService
  def initialize(user, params)
    @user, @params = user, params
  end

  def get
    check_object_exists && get_image_for_object
  end

  private

  def check_object_exists
    @object_class = @params[:object].singularize.capitalize.constantize
    return @object_class.is_a? Class
  rescue NameError
    return false
  end

  def get_image_for_object
    return object.image_url(version) if object.present?

    false
  end

  def object
    @object_class.find_by_id(@params[:id])
  end

  def version
    nil || @params[:version]
  end
end
