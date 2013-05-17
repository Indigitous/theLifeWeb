class ActivitySerializer < BaseSerializer
  include ImageAttributes

  attributes :id,
    :title,
    :summary,
    :full_description,
    :category_id,
    :priority,
    :threshold_ids,
    :has_threshold,
    :server_timestamp
end
