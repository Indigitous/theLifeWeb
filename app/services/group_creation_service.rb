class GroupCreationService
  def initialize(user, params)
    @user, @params = user, params
  end

  def create
    @user.groups.create(@params) do |group|
      group.owner = @user
    end
  end
end