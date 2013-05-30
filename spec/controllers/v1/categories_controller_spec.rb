require 'spec_helper'

describe V1::CategoriesController do
  before { sign_in }

  it_behaves_like 'a controller that requires an authentication'

  describe "#index" do
    let(:category) { build :category }
    let(:categories) { [category] }

    before do
      Category.stub(scoped: categories)
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns categories' do
      expect(controller.categories).to match_array(categories)
    end
  end
end
