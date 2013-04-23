require 'spec_helper'

describe MyEventSerializer do
  let(:event) { build :event, id: 1 }
  let(:json) { MyEventSerializer.new(event).to_json }

  subject { JSON.parse(json) }

  it { should be_a_my_event_representation(event) }
end
