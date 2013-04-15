ActiveRecord::Base.class_eval do
  def sliced_attributes(keys)
    attributes.slice(*keys)
  end

  def sliced_accessors(keys)
    accessors = {}

    keys.map { |key| accessors[key] = send(key) }

    accessors
  end
end
