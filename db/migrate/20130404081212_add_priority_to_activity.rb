class AddPriorityToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :priority, :integer, null: false, default: 10
  end
end
