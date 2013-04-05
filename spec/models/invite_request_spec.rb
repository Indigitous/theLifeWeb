require 'spec_helper'

describe InviteRequest do
  describe 'validations' do
    it { should validate_presence_of :user }
    it { should validate_presence_of :group }
    it { should validate_presence_of :kind }
    it { should ensure_inclusion_of(:kind).in_array(InviteRequest::TYPES) }
  end

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :group }
  end
end
