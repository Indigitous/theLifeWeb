require 'spec_helper'

describe GroupUser do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :group }
  end
end
