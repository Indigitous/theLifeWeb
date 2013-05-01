class Category < ActiveRecord::Base
  translates :name, :description

  has_many :activities

  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :translations

  def to_s
    self.name
  end
end
