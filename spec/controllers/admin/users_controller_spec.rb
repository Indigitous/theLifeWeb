require 'spec_helper'

describe Admin::UsersController do
  before do
    login_admin
  end
  describe "POST /users" do
    subject {post :create, :user => {email: 'adrian@ballistiq.com', password: '123456', password_confirmation: '123456', first_name: 'Adrian', last_name: 'Teh'}}
    it 'should redirect to newly created user page' do
      subject
      response.should redirect_to admin_user_path(User.last)
    end
  end
end