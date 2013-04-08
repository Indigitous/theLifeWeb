ActiveRecord::Base.class_eval do
  def sliced_attributes(keys)
    attributes.slice(*keys)
  end

  def sliced_accessors(keys)
    accessors = keys.map { |key| [key, send(key) ] }
    Hash[*accessors.flatten]
  end
end
