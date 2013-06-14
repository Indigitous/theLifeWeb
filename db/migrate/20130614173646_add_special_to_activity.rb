class AddSpecialToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :special, :string, default: nil, null: true
  end
end
