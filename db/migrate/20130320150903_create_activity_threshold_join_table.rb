class CreateActivityThresholdJoinTable < ActiveRecord::Migration
  def change
    create_table :activities_thresholds, id: false do |t|
      t.belongs_to :activity
      t.belongs_to :threshold
    end

    add_index(:activities_thresholds, [:activity_id, :threshold_id])
  end
end
