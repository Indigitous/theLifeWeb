class InviteRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :receiver,
    :user,
    :group,
    presence: true
end
