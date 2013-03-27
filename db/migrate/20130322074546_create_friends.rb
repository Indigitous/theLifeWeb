class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''

      t.belongs_to :user
      t.belongs_to :threshold

      t.timestamps
    end

    add_index :friends, :user_id
    add_index :friends, :threshold_id
  end
end
