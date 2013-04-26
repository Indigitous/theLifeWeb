class Category < ActiveRecord::Base
  translates :description

  has_many :activities

  validates :name, presence: true
  validates :description, presence: true
end
