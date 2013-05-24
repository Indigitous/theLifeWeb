require 'spec_helper'

describe '/v1/users' do
  let(:current_user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }
  let(:params) { { first_name: 'Homer', authentication_token: authentication_token } }

  describe 'list users in a group' do
    subject { json_response_body['data'] }

    let!(:group) { create :group, owner: current_user }

    it_behaves_like 'an api with timestamps' do
      let!(:resources) { create_list(:user, 2, groups: [group]) }
      let(:resources_url) { polymorphic_path([:v1, group, :users]) }
    end
  end

  describe 'updating user profile' do
    context 'with valid params' do
      it 'updates user record' do
        expect do
          put "/v1/users/#{current_user.id}", params
        end.to change { current_user.reload.first_name }
      end
    end

    context 'with invalid params' do
      before do
        put "/v1/users/#{current_user.id}", params.merge(first_name: nil)
      end

      subject { json_response_body }

      it { should have_error("can't be blank").on('first_name') }
    end

    it "allows updating only current user's information" do
      expect do
        put "/v1/users/#{another_user.id}", params
      end.to change { current_user.reload.first_name }
    end

    describe "add or update photo for current user" do
      let(:test_image) do
        Rack::Test::UploadedFile.new(
          Rails.root.join('spec', 'fixtures', 'images' , 'test_image.png')
        )
      end

      let(:params) do
        {
          image: test_image,
          authentication_token: authentication_token
        }
      end

      before do
        put "/v1/users/#{current_user.id}", params
        current_user.reload
      end

      it "updates current_user's image" do
        current_user.image_url.should be
        current_user.image_url(:thumbnail).should be
      end
    end
  end
end
