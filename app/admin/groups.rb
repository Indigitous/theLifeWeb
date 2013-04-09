ActiveAdmin.register Group do
  config.batch_actions = false
  index do
    column :name
    column :description
    column :owner
    column :created_at
    column :updated_at
    default_actions
  end

  controller do
    def scoped_collection
      Group.includes(:owner)
    end
  end

end
