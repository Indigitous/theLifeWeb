require 'spec_helper'

describe 'v1/groups' do
  let(:current_user) { FactoryGirl.create(:user) }
  let(:authentication_token) { current_user.authentication_token }
  let(:params) { FactoryGirl.attributes_for(:group) }


  describe 'creating a group' do
    before do
      post 'v1/groups', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }
    it { should be_a_group_representation(current_user.owned_groups.first) }

    describe 'group owner should become a member of his group' do
      let(:group) { Group.find(json_response_body['id']) }
      subject { group }

      its(:users) { should include(group.owner) }
    end

    context 'when params are not valid' do
      let(:params) { { name: 'The best group ever!' } }

      it { should have_error("can't be blank").on('description') }
    end
  end

  describe 'list groups' do
    let!(:group) { FactoryGirl.create(:group) }

    before do
      get 'v1/groups.json', authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_a_kind_of Array }
    its(:first) { should be_a_group_representation(group) }
  end
end
