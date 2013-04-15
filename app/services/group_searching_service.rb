class GroupSearchingService
  def initialize(query)
    @query = normalize_query(query)
  end

  def find_all_matching
    groups
  end

  private

  def normalize_query(query)
    if query.is_a?(String)
      query = query.split
    end

    query
  end

  def groups
    if @query.blank?
      Group.all
    else
      Group.search(name_or_description_matches_any: @query).all
    end
  end
end
