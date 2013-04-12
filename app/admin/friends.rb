ActiveAdmin.register Friend do
  belongs_to :user, :optional => true
  config.batch_actions = false

  index do
    column :first_name
    column :last_name
    column "Friend Of User", :user
    column :threshold
    default_actions
  end

  form do |f|
    f.inputs "Friend Details" do
      f.input :first_name
      f.input :last_name
      f.input :user, :label => "Friend of User"
      f.input :threshold, :include_blank => false
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row ("Friend of User") { ad.user }
      row :threshold
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  controller do
    def scoped_collection
      Friend.includes(:threshold, :user)
    end

    def create
      create! do |format|
        format.html do
          parent.present? ? redirect_to(admin_user_path(parent), :flash => flash) : redirect_to(admin_friend_path(resource), :flash => flash)
        end
      end
    end
  end

end
