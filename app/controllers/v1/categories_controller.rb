class V1::CategoriesController < V1::BaseController
  expose(:categories)

  # include_server_timestamp only: :index # TODO Android 0.81 compatibility; separate data and meta/server_timestamp fields

  def index
    self.categories = TimestampFilteringService.new(categories, params[:timestamp]).filter
    respond_with(categories)
  end
end
