class AddPushRegistrationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :push_registration, :string, limit: 4096, default: nil, null: true
  end
end
