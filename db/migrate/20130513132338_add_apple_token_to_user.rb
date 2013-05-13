class AddAppleTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :apple_token, :string
  end
end
