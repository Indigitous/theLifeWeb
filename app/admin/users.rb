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
      f.input :image
      f.input :remove_image, :as => :boolean
    end
    f.actions
  end

  show do
    columns do
      column :span => 3 do
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
      column :min_width => "200px" do
        panel "Image" do
          user.image.present? ? image_tag(image_admin_user_path(user)) : 'No Image Available'
        end
      end
    end
  end

  member_action :image do
    user = User.find(params[:id])
    send_file user.image_url, type: 'image/jpeg'
  end

  controller do
    # To allow update of user account without password
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

end
