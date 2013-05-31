require 'spec_helper'

describe V1::GroupsController do
  let(:user) { stub_model(User) }
  let(:group) { stub_model(Group) }
  let(:groups) { [group] }

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:method) { :post }
  end

  before do
    sign_in(user)
  end

  subject { response }

  describe 'create' do
    let(:params) do
      {
        name: 'The best group ever!',
        description: 'Group for my best friends!',
        format: :json
      }
    end

    context 'when group created successfully' do
      before do
        GroupCreationService.any_instance.stub(:create) { stub_model(Group) }
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

  describe '#index' do
    before do
      GroupSearchingService.any_instance.stub(find_all_matching: groups)
      get :index, format: :json
    end

    it { should be_success }
    its(:code) { should eq('200') }

    it 'assigns groups' do
      expect(controller.groups).to match_array(groups)
    end
  end

  describe '#destroy' do
    let(:group) { stub_model(Group, owner: user) }
    let(:params) { { id: group.id, format: :json } }

    describe 'when group does not exist or user is not a group owner' do
      before do
        GroupDeletionService.any_instance.stub(destroy: false)

        delete :destroy, params
      end

      it { should be_success }
      its(:code) { should eq('204')}
    end

    describe 'with valid params' do
      before do
        GroupDeletionService.any_instance.stub(destroy: true)

        delete :destroy, params
      end

      it { should be_success }
      its(:code) { should eq('204') }
    end
  end
end
