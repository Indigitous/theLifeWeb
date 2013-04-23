class ActivitySerializer < BaseSerializer
  attributes :id,
    :title,
    :summary,
    :full_description,
    :category_id,
    :priority

  def attributes
    hash = super

    hash.merge! image_attributes

    hash
  end
end
