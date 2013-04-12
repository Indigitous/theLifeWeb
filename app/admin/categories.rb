ActiveAdmin.register Category do
  config.batch_actions = false

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, :as => :ckeditor
    end
    f.buttons
  end
end
