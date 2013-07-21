class AddExtAuthToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, default: nil, null: true
    add_column :users, :uid, :string, default: nil, null: true
    add_index :users, :uid
  end
end
