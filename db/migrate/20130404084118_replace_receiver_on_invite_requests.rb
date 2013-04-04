class ReplaceReceiverOnInviteRequests < ActiveRecord::Migration
  def change
    remove_column :invite_requests, :receiver
    add_column :invite_requests, :email, :string
    add_column :invite_requests, :phone, :string
  end
end
