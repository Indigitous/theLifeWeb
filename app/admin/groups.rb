ActiveAdmin.register Group do
  belongs_to :user, :optional => true
  config.batch_actions = false

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
      paginated_collection(resource.users.page(params[:page]).per(25), download_links: false) do
        table_for(collection, sortable: false) do
          column :email
          column :first_name
          column :last_name
          column '' do |user|
            links = ''.html_safe
            if controller.action_methods.include?('show')
              links << link_to(I18n.t('active_admin.view'), admin_user_path(user), :class => "member_link view_link")
            end
            if controller.action_methods.include?('edit')
              links << link_to(I18n.t('active_admin.edit'), edit_admin_user_path(user), :class => "member_link edit_link")
            end
            links
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
