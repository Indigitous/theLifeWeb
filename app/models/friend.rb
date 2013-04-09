class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :threshold

  has_many :events, dependent: :destroy

  validates :first_name,
    :last_name,
    :user,
    :threshold,
    presence: true

  scope :recent, lambda { |n| includes(:user,:threshold).limit(n).order('id desc') }

  def to_s
    "#{self.first_name} #{self.last_name}"
  end
end
