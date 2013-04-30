require 'spec_helper'

describe V1::ImagesController do
  let(:user) { create :user, :with_image }

  before { sign_in user }

  subject { response }

  describe '#show' do
    let(:base_params) { { resources: 'users', id: user.id, format: :json } }

    before do
      get :show, params
    end

    context 'with valid params' do
      let(:params) { base_params }

      before do
        controller.stub!(:render)
      end

      its(:body) { should be_a_file_representation(user.image) }
      its(:code) { should eq('200') }
    end

    context 'with invalid params' do
      let(:params) { base_params.merge(version: 'nonexistent') }

      its(:body) { should_not be be_a_file_representation(user.image) }
      its(:code) { should eq('404') }
    end
  end
end
