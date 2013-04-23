class InviteRequest < ActiveRecord::Base
  INVITE = 'INVITE'.freeze
  REQUEST_MEMBERSHIP = 'REQUEST_MEMBERSHIP'.freeze
  TYPES = [INVITE, REQUEST_MEMBERSHIP]

  belongs_to :user
  belongs_to :group

  delegate :invite?, :request_membership?, to: :type
  delegate :full_name, to: :user, prefix: true
  delegate :name, to: :group, prefix: true

  alias_method :user_name, :user_full_name

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
