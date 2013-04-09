ActiveAdmin.register Friend do
  belongs_to :user
  config.batch_actions = false

  index do
    column :id
    column :first_name
    column :last_name
    column :threshold
    default_actions
  end

  form do |f|
    f.inputs "Friend Details" do
      f.input :first_name
      f.input :last_name
      f.input :threshold, :include_blank => false
    end
    f.actions
  end
end
