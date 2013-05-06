Rails.application.config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
  Bullet.rails_logger = true
  Bullet.console = true
  Bullet.airbrake = true
  Bullet.add_whitelist :type => :n_plus_one_query, :class_name => "Category", :association => :translations
  Bullet.add_whitelist :type => :n_plus_one_query, :class_name => "Activity", :association => :translations
end if defined?(Bullet)
