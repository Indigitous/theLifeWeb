class Activity < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :thresholds

  has_many :events

  validates :title,
    :summary,
    :full_description,
    :thresholds,
    :priority,
    presence: true

  validates :priority,
    inclusion: { in: (1..10) }
end
