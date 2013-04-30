class AddHasThresholdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :has_threshold, :boolean, null: false, default: false
  end
end
