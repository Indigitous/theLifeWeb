class AddEmailAndMobileToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :email, :string
    add_column :friends, :mobile, :string
  end
end
