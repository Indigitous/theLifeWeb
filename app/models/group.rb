class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
  validates :description,
    :owner,
    presence: true
end
