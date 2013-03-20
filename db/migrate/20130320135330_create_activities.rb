class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title, null: false, default: ''
      t.string :summary, null: false, default: ''
      t.text :full_description, null: false, default: ''

      t.belongs_to :category

      t.timestamps
    end

  add_index :activities, :category_id
  end
end
