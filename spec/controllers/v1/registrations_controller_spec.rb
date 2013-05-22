require 'spec_helper'

describe V1::RegistrationsController do
  before do
    set_devise_mapping(:user)
  end

  subject { response }

  describe '#create' do
    let(:params) { FactoryGirl.attributes_for(:user) }

    before { post(:create, params.merge(format: :json)) }

    it { should be_success }
    its(:code) { should eq('201') }
  end

  describe '#destroy' do
    let!(:user) { create :user }

    before do
      sign_in(user)
    end

    it_behaves_like 'a successfull DELETE request'
  end
end
