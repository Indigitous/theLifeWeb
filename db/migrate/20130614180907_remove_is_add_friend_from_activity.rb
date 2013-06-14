class RemoveIsAddFriendFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :is_add_friend
  end

  def down
    add_column :activities, :is_add_friend, :boolean, null: false, default: false
  end
end
