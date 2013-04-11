require 'spec_helper'

describe 'v1/friends' do
  let(:current_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'creating a friend' do
    let(:threshold_id) { create(:threshold).id }

    let(:params) do
      attributes_for(:friend, threshold_id: threshold_id)
    end

    before do
      post 'v1/friends', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }

    it { should be_a_friend_representation(current_user.friends.first) }

    context 'when params are not valid' do
      let(:params) { { first_name: 'Homer' } }

      it { should have_error("can't be blank").on('last_name') }
    end
  end

  describe 'deleting a friend' do
    let!(:friend) { create :friend, user: current_user }
    let!(:other_friend) { create :friend }

    describe 'when all params are valid' do
      it 'successfully deletes a friend' do
        expect do
          delete "/v1/friends/#{friend.id}",
            authentication_token: current_user.authentication_token
        end.to change { current_user.friends.count }
      end
    end

    describe 'when params are invalid' do
      describe 'when user has not such friend' do
        it 'does not delete friend' do
          expect do
            delete "/v1/friends/#{other_friend.id}",
              authentication_token: current_user
          end.not_to change { current_user.friends.count }
        end
      end
    end
  end

  describe 'updating a friend' do
    let!(:current_threshold) do
      create :threshold, title: Threshold::TITLES[0]
    end

    let!(:goal_threshold) do
      create :threshold, title: Threshold::TITLES.last
    end

    let!(:friend) { create :friend, user: current_user, threshold: current_threshold }

    describe 'when all params are valid' do
      it 'successfully updates a friend' do
        expect do
          put "/v1/friends/#{friend.id}",
            threshold_id: goal_threshold.id,
            authentication_token: current_user.authentication_token
        end.to change { Friend.find_by_id(friend.id).threshold_id }
      end
    end

    describe 'when params are invalid' do
      describe 'when invalid threshold is given' do
        it 'does not updates a friend' do
          expect do
            put "/v1/friends/#{friend.id}",
              threshold_id: Threshold::TITLES.size + 1,
              authentication_token: current_user.authentication_token
          end.not_to change { Friend.find_by_id(friend.id).threshold_id }
        end
      end
    end
  end
end
