ActiveAdmin.register Activity do
  config.batch_actions = false

  index do
    column :title
    column :summary
    column :category do |activity|
      activity.category
    end
    column :priority
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.globalize_inputs :translations do |t|
      t.inputs do
        t.input :title
        t.input :summary
        t.input :full_description, :as => :ckeditor
        t.input :locale, :as => :hidden
      end
    end
    f.inputs do
      f.input :category
      f.input :priority
      f.input :thresholds
      f.input :image
      f.input :remove_image, :as => :boolean
    end
    f.buttons
  end

  action_item :only => :show do
    link_to('New Activity', new_admin_activity_path)
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
    def edit
      @activity = Activity.includes(:translations, { :category => :translations }).find(params[:id])
    end

    def scoped_collection
      Activity.includes(:translations, { :category => :translations })
    end
  end
end
