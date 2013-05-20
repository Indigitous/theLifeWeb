class TimestampFilteringService
  def initialize(resources, timestamp)
    @resources = resources
    @timestamp = timestamp
  end

  def filter
    unless @timestamp.to_i.zero?
      @resources = @resources.where("#{table_name}.updated_at > ?", Time.at(@timestamp.to_i))
    end

    @resources
  end

  private

  def table_name
    @resources.klass.table_name
  end
end
