ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column :span => 3 do
        panel "Recent Events" do
          table_for Event.recent(15) do
            column :user
            column :friend
            column :activity
            column :prayer_requested
            column :created_at
          end
        end
        panel "Recent Friends" do
          table_for Friend.recent(15) do
            column :user
            column :first_name
            column :last_name
            column :threshold
            column :created_at
          end
        end
      end

      column :class => "column metric" do
        panel "Total Users" do
          h1 User.count
        end
        panel "Total Friends" do
          h1 Friend.count
        end
        panel "Total Events" do
          h1 Event.count
        end
      end
    end

  end # content
end
