require 'spec_helper'

describe ImagePathGettingService do
  let(:current_user) { create :user }

  let(:service) { described_class.new(current_user, params) }

  describe "#get" do
    subject { service.get }

    context 'when requested resource is not allowed' do
      let(:params) { { resources: 'babes', id: current_user.id } }

      it { should_not be }
    end

    context "user's image" do
      let!(:other_user) { create :user }
      let(:user_params) { { resources: 'users', id: current_user.id } }

      describe 'when user has not such comember' do
        let(:params) { { resources: 'users', id: other_user.id } }

        before do
          User.any_instance.should_not_receive(:image_url)
        end

        it { should_not be }
      end

      describe 'when user has no image attached to' do
        let(:params) { user_params }

        it { should_not be }
      end

      describe 'when user has image attached to' do
        context 'user requests base version of image' do
          let(:params) { user_params }

          before do
            User.any_instance.should_receive(:image_url)
            User.any_instance.stub(image_url: 'some/path/to/image')
          end

          it { should be_a_kind_of String }
        end

        context 'user requests non-base version of image' do
          let(:version) { "thumbnail" }
          let(:params) { user_params.merge(version: version) }

          before do
            User.any_instance.should_receive(:image_url).with(version)
            User.any_instance.stub(:image_url).with(version) {'some/path/to/image'}
          end

          it { should be_a_kind_of String }
        end
      end
    end

    context "friend's image" do
      let!(:friend) { create :friend, user: current_user }
      let!(:other_friend) { create :friend }
      let(:friend_params) { { resources: 'friends', id: friend.id } }

      describe 'when user has not such friend' do
        let(:params) { { resources: 'friends', id: other_friend.id } }

        before do
          Friend.any_instance.should_not_receive(:image_url)
        end

        it { should_not be }
      end

      describe 'when friend has not attached image' do
        let(:params) { friend_params }

        it { should_not be }
      end

      describe 'when friend has attached image' do
        context 'user requests base version of image' do
          let(:params) { friend_params }

          before do
            Friend.any_instance.should_receive(:image_url)
            Friend.any_instance.stub(image_url: 'some/path/to/image')
          end

          it { should be_a_kind_of String }
        end

        context 'user requests non-base version of image' do
          let(:version) { "thumbnail" }
          let(:params) { friend_params.merge(version: version) }

          before do
            Friend.any_instance.should_receive(:image_url).with(version)
            Friend.any_instance.stub(:image_url).with(version) {'some/path/to/image'}
          end

          it { should be_a_kind_of String }
        end
      end
    end
  end
end
