require 'spec_helper'

describe '/v1/my_users' do
  let(:current_user) { create(:user) }
  let(:another_user) { create(:user) }
  let!(:group) { create(:group, owner: current_user, users: [another_user]) }
  let(:authentication_token) { current_user.authentication_token }

  subject { json_response_body }

  describe "show current user's profile" do
    before do
      get "/v1/my_users/#{current_user.id}", authentication_token: authentication_token
    end

    it { should be_a_my_user_representation(current_user) }
  end

  describe "show another user's profile" do
    before do
      User.any_instance.stub(image_url: 'some/path/to/image.png')
      get "/v1/my_users/#{another_user.id}", authentication_token: authentication_token
    end

    it { should be_a_my_user_representation(another_user) }
  end
end
