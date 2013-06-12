class AddIsAddFriendToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :is_add_friend, :boolean, null: false, default: false
  end
end
