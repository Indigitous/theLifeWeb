class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :token_authenticatable

  has_many :friends, dependent: :destroy
  has_many :events

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :owned_groups, class_name: 'Group'

  before_save :ensure_authentication_token

  validates :first_name, :last_name, presence: true
end
