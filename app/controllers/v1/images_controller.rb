class V1::ImagesController < V1::BaseController
  def show
    image = ImagePathGettingService.new(current_user, params).get
    if image
      send_file image, type: 'image/jpeg', disposition: 'attachment'
    else
      head :not_found
    end
  end
end
