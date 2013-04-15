class GroupSearchingService
  def initialize(query)
    @query = query
  end

  def find_all_matching
    normalize

    return groups
  end

  private

  def normalize
    if @query.is_a?(String)
      @query = @query.split
    end
  end

  def groups
    if @query.nil? || @query.empty?
      @groups = Group.all
    else
      @groups ||= Group.search(name_or_description_matches_any: @query).all
    end
  end
end
