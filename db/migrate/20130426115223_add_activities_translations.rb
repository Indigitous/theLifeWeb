class AddActivitiesTranslations < ActiveRecord::Migration
  def up
    Activity.create_translation_table! title: :string,
      summary: :string,
      full_description: :text
  end

  def down
    Activity.drop_translation_table!
  end
end
