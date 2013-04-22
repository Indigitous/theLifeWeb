class AddPledgesCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pledges_count, :integer, null: false, default: 0
  end
end
