ActiveAdmin.register User do
  config.batch_actions = false

  action_item :only => :show do
    link_to('Manage Friends', admin_user_friends_path(resource))
  end

  action_item :only => :show do
    link_to('Manage Groups', admin_user_group_users_path(resource))
  end

  index do
    column :email
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email
  filter :first_name
  filter :last_name

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table *default_attribute_table_rows
    panel "Groups" do
      paginated_collection(resource.group_users.includes(:group => :owner).page(params[:page]).per(25), download_links: false) do
        table_for(collection, sortable: false) do
          column :group
          column "Owner" do |group_user|
            group_user.group.owner
          end
          column '' do |group_user|
            link_to('Remove From Group', admin_user_group_user_path(user,group_user), :method => :delete, :data => {:confirm => I18n.t('active_admin.delete_confirmation')}, :class => "member_link delete_link")
          end
        end
      end
    end
    panel "Friends" do
      paginated_collection(resource.friends.includes(:threshold).page(params[:page]).per(25), download_links: false) do
        table_for(collection, sortable: false) do
          column :first_name
          column :last_name
          column :threshold
          column '' do |friend|
            link_to('Delete', admin_user_friend_path(user,friend), :method => :delete, :data => {:confirm => I18n.t('active_admin.delete_confirmation')}, :class => "member_link delete_link")
          end
        end
      end
    end
    active_admin_comments
  end

end
