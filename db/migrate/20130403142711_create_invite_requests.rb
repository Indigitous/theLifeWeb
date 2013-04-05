class CreateInviteRequests < ActiveRecord::Migration
  def change
    create_table :invite_requests do |t|
      t.belongs_to :user, null: false
      t.belongs_to :group, null: false
      t.string :receiver, null: false, default: ''

      t.timestamps
    end

    add_index :invite_requests, :user_id
    add_index :invite_requests, :group_id
  end
end
