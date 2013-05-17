class BaseSerializer < ActiveModel::Serializer
  embed :ids, include: false
  alias_method :current_user, :scope

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end

  def server_timestamp
    Time.now().to_i
  end
end
