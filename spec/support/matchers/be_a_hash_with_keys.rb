RSpec::Matchers.define :be_a_hash_with_keys do |keys|
  match do |hash|
    expect(hash.keys.length).to eq keys.length

    keys.each do |key|
      expect(hash).to have_key(key)
    end
  end
end
