class AddIsEngagementToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :is_engagement, :boolean, null: false, default: false
  end
end
