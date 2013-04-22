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
      get "/v1/my_users/#{another_user.id}", authentication_token: authentication_token
    end

    it { should be_a_my_user_representation(another_user) }
  end

  describe "add or update photo for current user" do
    let(:test_image) { Rack::Test::UploadedFile.new(
      File.join(
        Rails.root, 'spec', 'support', 'images' , 'test_image.png'
      )
    )}

    let(:params) do
      {
        image: test_image,
        authentication_token: authentication_token
      }
    end

    before do
      post "/v1/image/users/#{current_user.id}", params
    end

    it "updates current_user's image" do
      should be_a_user_representation(current_user.reload)

      current_user.image_url.should be
      current_user.image_url(:thumbnail).should be
    end
  end
end
