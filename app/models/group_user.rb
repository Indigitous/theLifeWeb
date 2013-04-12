class GroupUser < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  delegate :email, :first_name, :last_name, :to => :user, :prefix => true

  validates_uniqueness_of :user_id, :scope => :group_id

  def to_s
    "#{user} - #{group.name}"
  end
end
