ActiveSupport.on_load(:action_controller) do
  # Enable parameter wrapping for JSON
  wrap_parameters(
    format: [:json, :url_encoded_form, :multipart_form],
    exclude: [Devise.token_authentication_key]
  )
end
