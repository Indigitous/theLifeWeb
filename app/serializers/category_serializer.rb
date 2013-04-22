class CategorySerializer < BaseSerializer
  attributes :id, :name, :description
  has_many :activities, embed: :objects
end
