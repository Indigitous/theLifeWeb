require 'spec_helper'

describe '/v1/users' do
  let(:current_user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }
  let(:params) { { first_name: 'Homer', authentication_token: authentication_token } }

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
  end
end
