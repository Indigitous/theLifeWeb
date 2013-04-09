require 'spec_helper'

describe Admin::AdminUsersController do
  before do
    login_admin
  end
  describe "POST /admin_users" do
    subject {post :create, :admin_user => {email: 'adrian@ballistiq.com', password: '123456', password_confirmation: '123456'}}
    it 'should redirect to newly created user page' do
      subject
      response.should redirect_to admin_admin_user_path(AdminUser.last)
    end
  end
end