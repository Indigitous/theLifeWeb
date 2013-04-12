class AddIdToGroupUsers < ActiveRecord::Migration
  def change
    add_column :group_users, :id, :primary_key
  end
end
