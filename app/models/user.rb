class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :token_authenticatable

  has_many :friends, dependent: :destroy
  has_many :events

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :owned_groups, class_name: 'Group'
  has_many :invite_requests

  alias_attribute :name, :first_name

  before_save :ensure_authentication_token

  validates :first_name, :last_name, presence: true

  mount_uploader :image, PhotoUploader

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def to_s
    full_name
  end

  def received_invite_requests
    InviteRequest
      .where(kind: InviteRequest::INVITE)
      .where('email = ? OR sms = ?', email, mobile)
      .order('id DESC')
  end

  def visible_profiles
    User.where(id: visible_user_ids)
  end

  def visible_user_ids
    user_ids = GroupUser
      .where(group_id: group_ids + owned_group_ids)
      .uniq
      .pluck(:user_id)

    user_ids << id unless user_ids.include?(id)

    user_ids
  end
end
