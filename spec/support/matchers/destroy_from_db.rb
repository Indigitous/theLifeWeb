RSpec::Matchers.define :destroy_from_db do |model|
  match do |proc|
    proc.call
    expect { model.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
