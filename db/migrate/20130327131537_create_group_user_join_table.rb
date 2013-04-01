class CreateGroupUserJoinTable < ActiveRecord::Migration
  def change
    create_table :group_users, id: false do |t|
      t.belongs_to :group
      t.belongs_to :user
    end

    add_index(:group_users, [:group_id, :user_id])
  end
end