require 'spec_helper'

describe 'Authentication with tokens' do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }

  it 'does not store user in session' do
    get profile_path(user)

    response.body.should include(user.email)

    get profile_path(another_user)

    response.body.should_not include(user.email)
    response.body.should include(another_user.email)
  end

  def profile_path(user)
    v1_my_user_path(user, authentication_token: user.authentication_token)
  end
end
