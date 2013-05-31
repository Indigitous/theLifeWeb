require 'spec_helper'

describe V1::ActivitiesController do
  before { sign_in }

  it_behaves_like('a controller that requires an authentication')

  subject { response }

  describe '#index' do
    let(:activity) { stub_model(Activity) }
    let(:activities) { [activity] }

    before do
      Activity.stub(:scoped) { activities }
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns all activities when no threshold_id and timestamp given' do
      expect(controller.activities).to match_array(activities)
    end
  end
end
