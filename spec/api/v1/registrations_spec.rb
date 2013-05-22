require 'spec_helper'

describe '/v1/register' do
  let(:params) { FactoryGirl.attributes_for(:user) }

  before do
    post '/v1/register.json', params
  end

  subject { json_response_body }

  it { should be_a_user_representation(User.first) }

  context 'when user email has already been taken' do
    let(:user) { FactoryGirl.create(:user) }
    let(:params) { { email: user.email } }

    it { should have_error('has already been taken').on('email') }
  end
end

describe '/v1/users' do
  let!(:user) { create :user }
  let(:params) { { authentication_token: user.authentication_token } }
  let(:delete_request) { delete '/v1/users', params }

  subject { -> { delete_request } }
  it { should destroy_from_db(user) }
end
