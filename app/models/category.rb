class Category < ActiveRecord::Base
  has_many :activities

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end