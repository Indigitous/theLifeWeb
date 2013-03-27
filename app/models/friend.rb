class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :threshold

  validates :first_name,
    :last_name,
    :user,
    :threshold,
    presence: true
end
