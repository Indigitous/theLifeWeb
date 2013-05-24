class V1::MyGroupsController < V1::BaseController
  expose(:my_groups) { current_user.groups }
  include_server_timestamp only: :index

  def index
    groups = TimestampFilteringService.new(my_groups, params[:timestamp]).filter
    respond_with(groups, each_serializer: MyGroupSerializer)
  end
end
