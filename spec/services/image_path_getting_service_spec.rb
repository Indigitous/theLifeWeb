require 'spec_helper'

describe ImagePathGettingService do
  let(:user) { double(:user) }

  let(:service) { ImagePathGettingService.new(user, params) }
  let(:resource) { double(:resource, image_url: '') }

  describe '#to_image' do
    before do
      resource.stub_chain(:image, :version_names)
        .and_return('thumbnail', 'original')
    end

    subject { service.to_image }

    describe 'collection from params' do
      before do
        collection.stub(:find)
          .with(1)
          .and_return(resource)
      end

      context 'with user_id' do
        let(:params) { { user_id: 1, version: '' } }
        let(:collection) { double(:users_collection) }

        before do
          user.stub(:visible_profiles).and_return(collection)
        end

        it { should be }
      end

      context 'with friend_id' do
        let(:params) { { friend_id: 1, version: '' } }
        let(:collection) { double(:friends_collection) }

        before do
          user.stub(:friends).and_return(collection)
        end

        it { should be }
      end

      context 'with activity_id' do
        let(:params) { { activity_id: 1, version: '' } }
        let(:collection) { double(:activities_collection) }

        before do
          Activity.stub(:scoped).and_return(collection)
        end

        it { should be }
      end
    end

    describe 'returns image version from params' do
      let(:params) { { version: version } }


      before do
        service.stub(resource: resource)
      end

      context 'when version is exists' do
        let(:version) { 'thumbnail' }

        before do
          resource.stub(:image_url)
            .with(version)
            .and_return(version)
        end

        it { should eq version }
      end

      context 'when verions is not exists' do
        let(:version) { 'unexpected' }
        it { should be_nil }
      end
    end
  end
end
