require 'spec_helper'

describe '/v1/categories' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  describe 'list all categories' do
    let!(:category) { create :category }

    before do
      get 'v1/categories', authentication_token: authentication_token
    end

    subject { json_response_body['data'] }

    its(:first) { should be_a_category_representation(category) }
  end

  it_behaves_like 'an api with timestamps' do
    let(:resources) { create_list :category, 2 }
  end
end
