class AddThresholdIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :threshold_id, :integer
    add_index :events, :threshold_id
  end
end
