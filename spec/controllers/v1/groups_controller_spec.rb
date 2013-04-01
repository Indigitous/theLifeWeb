require 'spec_helper'

describe V1::GroupsController do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  describe 'create' do
    let(:params) do
      {
        name: 'The best group ever!',
        description: 'Group for my best friends!',
        format: :json
      }
    end

    it_behaves_like('a controller that requires an authentication') do
      let(:action) { :create }
      let(:method) { :post }
    end

    subject { response }

    context 'when group created successfully' do
      before do
        GroupCreationService.any_instance.stub(:create) { FactoryGirl.build(:group) }
        post :create, params
      end

      it { should be_success }
      its(:code) { should eq('201') }
    end

    context 'when params are invalid' do
      before do
        GroupCreationService.any_instance.stub(:create) { double(errors: ['error']) }
        post :create, params
      end

      it { should_not be_success }
      its(:code) { should eq('422') }
    end
  end
end