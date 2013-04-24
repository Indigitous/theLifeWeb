class BaseSerializer < ActiveModel::Serializer
  embed :ids, include: false
  alias_method :current_user, :scope
end
