class AddTypeToInviteRequest < ActiveRecord::Migration
  def change
    add_column :invite_requests, :kind, :string, default: 'INVITE', null: false
  end
end
