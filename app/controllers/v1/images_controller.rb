class V1::ImagesController < V1::BaseController
  def show
    image = ImagePathGettingService.new(current_user, params)
    respond_with(image, responder: ImageResponder)
  end
end
