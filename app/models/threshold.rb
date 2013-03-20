class Threshold < ActiveRecord::Base
  TITLES = [
    'New contact',
    'Trusting',
    'Curious',
    'Open',
    'Seeking',
    'Entering',
    'Christian'
  ]

  validates :title,
    presence: true,
    uniqueness: true,
    inclusion: TITLES

  has_and_belongs_to_many :activities
end