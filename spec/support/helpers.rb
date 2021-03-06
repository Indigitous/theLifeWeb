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

  def sign_in(user = stub_model(User))
    request.env['warden'].stub(authenticate!: user)
    controller.stub(current_user: user)
  end

  def sign_out(scope = :user)
    request.env['warden'].stub(:authenticate!).
      and_throw(:warden, { scope: scope })
    controller.stub(current_user: nil)
  end
end
