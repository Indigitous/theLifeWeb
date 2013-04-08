require 'spec_helper'

describe MyFriendSerializer do
  let(:friend) { build :friend, id: 1 }
  let(:json) { MyFriendSerializer.new(friend).to_json }

  subject { JSON.parse(json) }

  it { should be_a_friend_representation(friend) }
end
