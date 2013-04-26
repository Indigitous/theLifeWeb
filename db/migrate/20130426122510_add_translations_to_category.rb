class AddTranslationsToCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :description
    remove_column :categories, :name
    Category.create_translation_table! description: :text, name: :string
  end

  def down
    Category.drop_translation_table!
    add_column :categories, :description, :text, null: false, default: ''
    add_column :categories, :name, :string, null: false, default: ''
  end
end
