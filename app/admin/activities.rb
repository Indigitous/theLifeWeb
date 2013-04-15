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
      f.input :thresholds
    end
    f.buttons
  end

  show do
    attributes_table *default_attribute_table_rows
    panel "Thresholds" do
      table_for(resource.thresholds) do
        column :title
      end
    end
    active_admin_comments
  end

  controller do
    def scoped_collection
      Activity.includes(:category)
    end
  end
end
