class Category < ActiveRecord::Base
  translates :name, :description

  has_many :activities

  validates :name, presence: true
  validates :description, presence: true
end
