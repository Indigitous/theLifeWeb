class V1::UsersController < ApplicationController
  expose(:group)
  expose(:users, ancestor: :group)

  def index
    respond_with(users)
  end
end
