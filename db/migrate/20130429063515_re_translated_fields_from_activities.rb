class ReTranslatedFieldsFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :title
    remove_column :activities, :summary
    remove_column :activities, :full_description
  end

  def down
    with_options null: false, default: '' do |t|
      t.add_column :activities, :title, :string
      t.add_column :activities, :summary, :string
      t.add_column :activities, :full_description, :text
    end
  end
end
