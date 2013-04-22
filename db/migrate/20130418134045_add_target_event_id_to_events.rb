class AddTargetEventIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :target_event_id, :integer
    add_index :events, :target_event_id
  end
end
