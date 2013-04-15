class GroupSearchingService
  def initialize(query)
    @query = normalize_query(query)
  end

  def find_all_matching
    groups
  end

  private

  def normalize_query(query)
    query.is_a?(String) ? query.split : query
  end

  def groups
    if @query.blank?
      Group.all
    else
      Group.search(name_or_description_matches_any: @query).all
    end
  end
end
