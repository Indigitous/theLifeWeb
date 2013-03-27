class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :threshold

  has_many :events, dependent: :destroy

  validates :first_name,
    :last_name,
    :user,
    :threshold,
    presence: true
end
