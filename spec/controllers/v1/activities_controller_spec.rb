require 'spec_helper'

describe V1::ActivitiesController do
  let(:current_user) { create :user }

  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication')

  subject { response }

  describe '#index' do
    let(:activity) { build :activity }
    let(:activities) { [activity] }

    before do
      Activity.stub(:scoped) { activities }
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns all activities when no threshold_id is providen' do
      expect(controller.activities).to match_array(activities)
    end
  end
end
