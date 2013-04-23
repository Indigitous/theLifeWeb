class ActivitySerializer < BaseSerializer
  attributes :id,
    :title,
    :summary,
    :full_description,
    :category_id,
    :priority

  def attributes
    super.merge(image_attributes)
  end
end
