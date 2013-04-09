ActiveAdmin.register Event do
  config.batch_actions = false

  index do
    column :user
    column :friend
    column :activity
    column :prayer_requested
    column :created_at
    column :updated_at
    default_actions
  end

  controller do
    def scoped_collection
      Event.includes(:user,:friend,:activity)
    end
  end
end
