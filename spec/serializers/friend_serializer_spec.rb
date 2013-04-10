require 'spec_helper'

describe FriendSerializer do
  let(:friend) { build :friend, id: 1 }
  let(:json) { FriendSerializer.new(friend).to_json }

  subject { JSON.parse(json) }

  it { should be_a_friend_representation(friend) }
end
