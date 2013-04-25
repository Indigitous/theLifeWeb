class ImageResponder < ActionController::Responder

  delegate :send_file, to: :controller

  def respond
    image_path = resource.to_image

    if image_path
      send_file(image_path, type: 'image/jpeg', disposition: 'attachment')
    else
      head(:not_found)
    end
  end
end
