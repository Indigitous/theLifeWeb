class AddGoogleRegistrationIdToUser < ActiveRecord::Migration
  def change
    add_column :users,
      :google_registration_id, :string
  end
end
