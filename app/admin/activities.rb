ActiveAdmin.register Activity do
  config.batch_actions = false

  index do
    column :title
    column :summary
    column :category
    column :priority
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :summary
      f.input :full_description, :as => :ckeditor
      f.input :category
      f.input :priority
    end
    f.buttons
  end

  controller do
    def scoped_collection
      Activity.includes(:category)
    end
  end
end
