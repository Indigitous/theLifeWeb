class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.belongs_to :user

      t.timestamps
    end

    add_index(:groups, :user_id)
  end
end
