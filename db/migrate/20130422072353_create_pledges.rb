class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end

    add_index :pledges, :user_id
    add_index :pledges, :event_id
    add_index :pledges, [:user_id, :event_id]
  end
end
