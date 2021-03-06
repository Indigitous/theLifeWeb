class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :invite_requests, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  delegate :count, to: :users, prefix: true

  alias_method :member_ids, :user_ids
end
