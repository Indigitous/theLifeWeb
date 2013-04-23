class ActivitySerializer < BaseSerializer
  include ImageAttributes

  attributes :id,
    :title,
    :summary,
    :full_description,
    :category_id,
    :priority
end
