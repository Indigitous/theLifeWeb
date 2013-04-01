class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.belongs_to :friend
      t.belongs_to :activity

      t.boolean :prayer_requested, null: false, default: 0

      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :friend_id
    add_index :events, :activity_id
  end
end
