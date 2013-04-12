ActiveAdmin.register GroupUser do
  menu false
  controller.belongs_to :user, :group, polymorphic: true

  config.batch_actions = false

  filter :group
  filter :user_email, :as => :string
  filter :user_first_name, :as => :string
  filter :user_last_name, :as => :string

  index do
    column :group
    column :user
    column :first_name do |group_user|
      group_user.user.first_name
    end
    column :last_name do |group_user|
      group_user.user.last_name
    end
    default_actions
  end

  controller do
    def scoped_collection
      parent.group_users.includes(:group, :user)
    end
  end

end
