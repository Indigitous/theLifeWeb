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
      f.input :image
      f.input :remove_image, :as => :boolean
    end
    f.buttons
  end

  show do
    columns do
      column :span => 3 do
        attributes_table *default_attribute_table_rows
        panel "Thresholds" do
          table_for(resource.thresholds) do
            column :title
          end
        end
        active_admin_comments
      end
      column :min_width => "200px" do
        panel "Image" do
          activity.image? ? image_tag(image_admin_activity_path(activity)) : 'No Image Available'
        end
      end
    end
  end

  member_action :image do
    activity = Activity.find(params[:id])
    send_file activity.image_url, type: 'image/jpeg'
  end

  controller do
    def scoped_collection
      Activity.includes(:category)
    end
  end
end
