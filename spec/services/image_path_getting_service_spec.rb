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

    context 'user' do
      describe 'when user has no image attached to' do
        let(:params) { { resources: 'users', id: current_user.id } }

        it { should_not be }
      end

      describe 'when user has image attached to' do
        context 'user requests base version of image' do
          let(:params) { { resources: 'users', id: current_user.id } }

          before do
            User.any_instance.should_receive(:image_url)
            User.any_instance.stub(image_url: 'some/path/to/image')
          end

          it { should be_a_kind_of String }
        end

        context 'user requests non-base version of image' do
          let(:version) { "thumbnail" }
          let(:params) do
            {
              resources: 'users',
              id: current_user.id,
              version: version
            }
          end

          before do
            User.any_instance.should_receive(:image_url).with(version)
            User.any_instance.stub(:image_url).with(version) {'some/path/to/image'}
          end

          it { should be_a_kind_of String }
        end
      end
    end
  end
end
