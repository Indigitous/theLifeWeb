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

  controller do
    def scoped_collection
      Activity.includes(:category)
    end
  end
end
