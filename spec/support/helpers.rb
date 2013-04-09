module Helpers
  def set_devise_mapping(mapping_name = :user)
    @request.env['devise.mapping'] = Devise.mappings[mapping_name]
  end

  def json_response_body
    JSON.parse(response.body)
  end

  def login_admin
    set_devise_mapping(:admin_user)
    admin = create(:admin_user)
    sign_in admin
  end
end
