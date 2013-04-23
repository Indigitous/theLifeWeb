class ActivitySerializer < BaseSerializer
  attributes :id,
    :title,
    :summary,
    :full_description,
    :category_id,
    :priority,
    :threshold_ids
end
