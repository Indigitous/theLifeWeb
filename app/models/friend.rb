class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :threshold

  has_many :events, dependent: :destroy

  alias_attribute :name, :first_name

  validates :first_name,
    :last_name,
    :user,
    :threshold,
    presence: true

  mount_uploader :image, PhotoUploader

  scope :recent, lambda { |n| includes(:user,:threshold).limit(n).order('id desc') }

  def to_s
    "#{self.first_name} #{self.last_name}"
  end
end
