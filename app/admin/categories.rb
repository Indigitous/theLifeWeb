ActiveAdmin.register Category do
  config.batch_actions = false

  index do
    column :id
    column :name
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.globalize_inputs :translations do |t|
      t.inputs do
        t.input :name
        t.input :description
        t.input :locale, :as => :hidden
      end
    end
    f.buttons
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  controller do
    def scoped_collection
      Category.includes(:translations)
    end
  end
end
