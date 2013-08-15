class InviteRequest < ActiveRecord::Base
  INVITE = 'INVITE'.freeze                          # Group leader invites a person to join the group
  REQUEST_MEMBERSHIP = 'REQUEST_MEMBERSHIP'.freeze  # User requests to join the group
  TYPES = [INVITE, REQUEST_MEMBERSHIP]

  DELIVERED = 'DELIVERED'.freeze
  ACCEPTED = 'ACCEPTED'.freeze
  REJECTED = 'REJECTED'.freeze
  STATUSES = [DELIVERED, ACCEPTED, REJECTED]

  belongs_to :sender, class_name: 'User', foreign_key: :user_id
  belongs_to :group

  scope :accepted_or_rejected, where(status: [ACCEPTED, REJECTED])
  scope :delivered, where(status: DELIVERED)

  delegate :invite?, :request_membership?, to: :type
  delegate :full_name, to: :sender, prefix: true
  delegate :full_name, to: :recipient, prefix: true, allow_nil: true
  delegate :name, to: :group, prefix: true

  alias_attribute :recipient_email, :email

  # TODO compatibility with Android 0.81
  alias_attribute :user_name, :sender_full_name

  validates :sender,
    :group,
    presence: true

  validates :kind,
    presence: true,
    inclusion: TYPES

  validates :status, inclusion: STATUSES

  validate :members_quota

  def recipient
    User.where('email = ? OR mobile = ?', email, sms).first
  end

  def recipient_id
    recipient && recipient.id
  end

  def type
    self[:kind].to_s.downcase.inquiry
  end

  private

  def members_quota
    if group && group.users_count >= Setting.max_users_in_group
      errors.add(:group, I18n.t('errors.messages.group_limit_reached'))
    end
  end
end
