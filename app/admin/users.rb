ActiveAdmin.register User do
  config.batch_actions = false

  action_item :only => :show do
    link_to('Add Friend', new_admin_user_friend_path(resource))
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
      paginated_collection(resource.groups.includes(:owner).page(params[:page]).per(25), download_links: false) do
        table_for(collection, sortable: false) do
          column :name
          column :owner
          column '' do |group|
            links = ''.html_safe
            if controller.action_methods.include?('show')
              links << link_to(I18n.t('active_admin.view'), admin_group_path(group), :class => "member_link view_link")
            end
            if controller.action_methods.include?('edit')
              links << link_to(I18n.t('active_admin.edit'), edit_admin_group_path(group), :class => "member_link edit_link")
            end
            links
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
            links = ''.html_safe
            if controller.action_methods.include?('show')
              links << link_to(I18n.t('active_admin.view'), admin_friend_path(friend), :class => "member_link view_link")
            end
            if controller.action_methods.include?('edit')
              links << link_to(I18n.t('active_admin.edit'), edit_admin_friend_path(friend), :class => "member_link edit_link")
            end
            links
          end
        end
      end
    end
    active_admin_comments
  end

end
