require 'spec_helper'

describe MyEventSerializer do
  let(:user) { stub_model(User, id: 1, first_name: 'User') }
  let(:friend) { stub_model(Friend, id: 1, name: 'Friend') }
  let(:event) { stub_model(Event, id: 1, user: user, friend: friend, created_at: Time.now) }

  let(:serializer) { MyEventSerializer.new(event) }

  subject { serializer.as_json }

  describe '#has_pledged' do
    let(:pledged_user_ids) { [] }

    before do
      serializer.stub(current_user: user)
      event.stub(pledged_user_ids: pledged_user_ids)
    end

    it { should include(has_pledged: false) }

    context 'when user has pledged' do
      let(:pledged_user_ids) { [1, 2] }
      it { should include(has_pledged: true) }
    end
  end
end
