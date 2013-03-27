require 'spec_helper'

describe 'v1/friends' do
  let(:current_user) { FactoryGirl.create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'creating a friend' do
    let(:threshold_id) { Threshold.first.id }

    let(:params) do
      FactoryGirl.attributes_for(:friend, threshold_id: threshold_id)
        .merge(format: :json)
    end

    before do
      post 'v1/friends', params.merge(authentication_token: authentication_token)
    end

    it 'responds with a friend representation' do
      json_response_body.should be_a_friend_representation(current_user.friends.first)
    end

    it 'creates a friend for the current user' do
      expect(current_user.friends.length).to eq 1
    end

    context 'when params are not valid' do
      let(:params) { { first_name: 'Homer' } }

      subject { json_response_body }

      it { should have_error("can't be blank").on('last_name') }
    end
  end
end
