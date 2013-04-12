ActiveAdmin.register GroupUser do
  belongs_to :user
  config.batch_actions = false

  filter :group

  index do
    column :group
    column :user
    default_actions
  end

  controller do
    def scoped_collection
      parent.group_users.includes(:group, :user)
    end
  end

end
