class PledgeSerializer < BaseSerializer
  attributes :id,
    :user_id,
    :event_id,
    :event_pledges_count

  delegate :event_pledges_count, to: :object
end
