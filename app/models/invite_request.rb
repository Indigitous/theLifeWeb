class InviteRequest < ActiveRecord::Base
  INVITE = 'INVITE'.freeze
  REQUEST_MEMBERSHIP = 'REQUEST_MEMBERSHIP'.freeze
  TYPES = [INVITE, REQUEST_MEMBERSHIP]

  DELIVERED = 'DELIVERED'.freeze
  ACCEPTED = 'ACCEPTED'.freeze
  REJECTED = 'REJECTED'.freeze
  STATUSES = [DELIVERED, ACCEPTED, REJECTED]

  belongs_to :user
  belongs_to :group

  belongs_to :invited_user,
    class_name: 'User',
    foreign_key: :email,
    primary_key: :email

  scope :accepted_or_rejected, where(status: [ACCEPTED, REJECTED])
  scope :delivered, where(status: DELIVERED)

  delegate :invite?, :request_membership?, to: :type
  delegate :full_name, to: :user, prefix: true
  delegate :full_name, to: :invited_user, prefix: true, allow_nil: true
  delegate :name, to: :group, prefix: true

  alias_method :user_name, :user_full_name

  validates :user,
    :group,
    presence: true

  validates :kind,
    presence: true,
    inclusion: TYPES

  validates :status, inclusion: STATUSES

  validate :members_quota

  def type
    self[:kind].to_s.downcase.inquiry
  end

  def user_name
    status == DELIVERED ? user_full_name : invited_user_full_name
  end

  private

  def members_quota
    if group && group.users_count >= Setting.max_users_in_group
      errors.add(:group, I18n.t('errors.messages.group_limit_reached'))
    end
  end
end
