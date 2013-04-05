require 'spec_helper'

describe V1::InviteRequestsController do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:another_group) { create(:group) }

  before do
    sign_in(user)
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:method) { :post }
  end

  subject { response }

  describe '#create' do
    context 'inviting person' do
      let(:params) do
        {
          group_id: group.id,
          email: generate(:email),
          type: 'INVITE',
          format: :json
        }
      end

      context 'with valid params' do
        before do
          post :create, params
        end

        it { should be_success }
        its(:code) { should eq('201') }
      end

      context 'with invalid params' do
        let(:params) do
          {
            group_id: group.id,
            format: :json
          }
        end

        before do
          post :create, params
        end

        it { should_not be_success }
        its(:code) { should eq('422') }
      end
    end

    context 'requesting membership' do
      let(:params) do
        {
          group_id: another_group.id,
          type: 'REQUEST_MEMBERSHIP',
          format: :json
        }
      end

      context 'with valid params' do
        before do
          post :create, params
        end

        it { should be_success }
        its(:code) { should eq('201') }
      end

      context 'with invalid params' do
        let(:params) do
          {
            group_id: group.id,
            format: :json
          }
        end

        before do
          post :create, params
        end

        it { should_not be_success }
        its(:code) { should eq('422') }
      end
    end
  end
end
