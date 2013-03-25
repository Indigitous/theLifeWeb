class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''

      t.belongs_to :user

      t.timestamps
    end
  end
end
