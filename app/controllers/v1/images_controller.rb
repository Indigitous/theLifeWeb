class V1::ImagesController < V1::BaseController
  def show
    image = ImagePathGettingService.new(current_user, params).get
    if image
      send_file image
    else
      head :not_found
    end
  end

  def update
  end
end
