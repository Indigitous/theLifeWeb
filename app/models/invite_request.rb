class InviteRequest < ActiveRecord::Base
  INVITE = 'INVITE'.freeze
  REQUEST_MEMBERSHIP = 'REQUEST_MEMBERSHIP'.freeze
  TYPES = [INVITE, REQUEST_MEMBERSHIP]

  belongs_to :user
  belongs_to :group

  delegate :invite?, :request_membership?, to: :type

  validates :user,
    :group,
    :kind,
    presence: true

  validates :kind,
    inclusion: TYPES


  def type
    self[:kind].to_s.downcase.inquiry
  end
end
