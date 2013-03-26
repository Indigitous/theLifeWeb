class CreateThresholds < ActiveRecord::Migration
  def change
    create_table :thresholds do |t|
      t.string :title, null: false, default: ''

      t.timestamps
    end
  end
end
