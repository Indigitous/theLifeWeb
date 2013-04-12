class GroupUser < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :group_id

  def to_s
    "#{user} - #{group.name}"
  end
end
