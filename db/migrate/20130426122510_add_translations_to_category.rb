class AddTranslationsToCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :description
    Category.create_translation_table! description: :text
  end

  def down
    Category.drop_translation_table!
    add_column :categories, :description, :text, null: false, default: ''
  end
end
