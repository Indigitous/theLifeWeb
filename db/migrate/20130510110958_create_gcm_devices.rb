class CreateGcmDevices < ActiveRecord::Migration
  def up
    create_table :gcm_devices do |t|
      t.string :registration_id, size: 120,
        null: false, default: 'some_google_registration_id'
      t.datetime :last_registered_at
      t.belongs_to :user

      t.timestamps
    end

    add_index :gcm_devices, :registration_id, :unique => true
  end

  def down
    drop_table :gcm_devices
  end
end
