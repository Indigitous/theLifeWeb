class V1::MyGroupsController < V1::BaseController
  expose(:my_groups) { current_user.owned_groups }

  def index
    respond_with(my_groups, each_serializer: MyGroupSerializer)
  end
end
