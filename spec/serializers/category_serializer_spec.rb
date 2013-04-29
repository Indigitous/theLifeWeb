require 'spec_helper'

describe CategorySerializer do
let(:category) { build :category, id: 1 }
  let(:json) { CategorySerializer.new(category).to_json }

  subject { JSON.parse(json) }

  it { should be_a_category_representation(category) }
end
