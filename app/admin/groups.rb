ActiveAdmin.register Group do
  belongs_to :user, :optional => true
  config.batch_actions = false

  action_item :only => :show do
    link_to('Manage Users', admin_group_group_users_path(resource))
  end

  index do
    column :name
    column :description
    column :owner
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    attributes_table *default_attribute_table_rows
    panel "Users" do
      paginated_collection(resource.group_users.includes(:user).page(params[:page]).per(25), download_links: false) do
        table_for(collection, sortable: false) do
          column :email do |group_user|
            link_to group_user.user.email, [:admin,group_user.user]
          end
          column :first_name do |group_user|
            group_user.user.first_name
          end
          column :last_name do |group_user|
            group_user.user.last_name
          end
          column '' do |group_user|
            link_to('Remove From Group', admin_group_group_user_path(group,group_user), :method => :delete, :data => {:confirm => I18n.t('active_admin.delete_confirmation')}, :class => "member_link delete_link")
          end
        end
      end
    end
    active_admin_comments
  end

  controller do
    def scoped_collection
      Group.includes(:owner)
    end
  end

end
