require 'spec_helper'

describe PhotoUploader do
  let(:user) { stub_model(User, id: 1) }
  let(:uploader) { PhotoUploader.new(user) }
  let(:cache_id) { '20071201-1234-345-2255' }

  before do
    CarrierWave.stub!(:generate_cache_id).and_return(cache_id)
  end

  after do
    FileUtils.rm_rf(uploader.cache_dir)
  end

  describe '#url' do
    let(:version) { :thumbnail }

    def base_url(file_name)
      File.join(uploader.cache_dir, cache_id, "#{file_name}.png")
    end

    before do
      uploader.cache!(File.open(file_path('images/test_image.png')))
    end

    subject { uploader.url(version) }

    it { should eq(base_url('thumbnail_test_image')) }

    context 'when version is original' do
      let(:version) { :original }

      it { should eq(base_url('test_image')) }
    end
  end

  describe '#version_names' do
    let(:expected) { ['original', 'thumbnail'] }
    its(:version_names) { should eq(expected) }
  end
end
