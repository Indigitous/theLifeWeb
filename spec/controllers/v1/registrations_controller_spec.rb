require 'spec_helper'

describe V1::RegistrationsController do
  before do
    set_devise_mapping(:user)
  end

  describe '#create' do
    let(:params) { FactoryGirl.attributes_for(:user) }

    before { post(:create, params.merge(format: :json)) }

    it 'responds successfully with an HTTP 201 status code' do
      expect(response).to be_success
      expect(response.code).to eq('201')
    end
  end
end
