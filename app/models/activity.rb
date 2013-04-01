class Activity < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :thresholds

  has_many :events

  validates :title,
    :summary,
    :full_description,
    :thresholds,
    presence: true
end
