require 'spec_helper'

describe 'v1/users/:user_id/image/:version' do
  let(:user) { create(:user, :with_image) }
  let(:authentication_token) { user.authentication_token }
  let(:user_id) { user.id }
  let(:version) { 'original' }

  before do
    get "v1/users/#{user_id}/image/#{version}",
      authentication_token: authentication_token
  end

  subject { response }

  its(:body) { should be_a_file(user.image) }

  context 'with thumbnail version' do
    let(:version) { 'thumbnail' }
    its(:body) { should be_a_file(user.image.thumbnail) }
  end

  context 'with unexpected version' do
    let(:version) { 'unexpected' }
    its(:status) { should eq(404) }
  end
end
