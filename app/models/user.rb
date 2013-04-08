class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :token_authenticatable

  has_many :friends, dependent: :destroy
  has_many :events

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :owned_groups, class_name: 'Group'
  has_many :invite_requests

  before_save :ensure_authentication_token

  validates :first_name, :last_name, presence: true

  def received_invite_requests
    InviteRequest
      .where(email: email, kind: InviteRequest::INVITE)
      .order('id desc')
  end
end
