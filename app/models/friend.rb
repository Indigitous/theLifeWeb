class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :threshold

  has_many :events, dependent: :destroy

  alias_attribute :name, :first_name

  validates :first_name,
    :user,
    :threshold,
    presence: true
  validates :last_name, uniqueness: { scope: [ :user_id, :first_name ] }

  mount_uploader :image, ImageUploader

  scope :recent, lambda { |n| includes(:user,:threshold).limit(n).order('id desc') }

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def to_s
    "#{self.first_name} #{self.last_name}"
  end
end
