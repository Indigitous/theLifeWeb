class AddStatusToInviteRequests < ActiveRecord::Migration
  def change
    add_column :invite_requests,
      :status, :string,
      default: InviteRequest::DELIVERED,
      null: false
  end
end
