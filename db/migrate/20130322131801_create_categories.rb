class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''

      t.timestamps
    end
  end
end
