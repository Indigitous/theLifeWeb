source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'mysql2'
gem 'airbrake'
gem 'thin'
gem 'decent_exposure'
gem 'active_model_serializers'
gem 'seedbank'
gem 'dotenv'
gem 'devise'
gem 'heroku'
gem 'strong_parameters'
gem 'jquery-rails'
gem 'activeadmin'
gem 'ckeditor'
gem 'select2-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'globalize3'
gem 'rails-i18n'
gem 'ActiveAdmin-Globalize3-inputs', :git => "git://github.com/AdrianTeh/ActiveAdmin-Globalize3-inputs.git"
gem 'mandrill-api'
gem 'nilify_blanks'
gem 'it'

# Google OAuth2 support
gem 'google-id-token'

# Google Cloud Messaging support
gem 'gcm'

# Facebook support
gem "koala", "~> 1.7.0rc1"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
  gem 'jquery-ui-rails'
  gem 'slim'
end

gem 'capistrano'
gem 'rvm-capistrano'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet',   '~> 4.6.0'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails'
  gem 'mail_safe'
  gem 'rails_best_practices'
  gem 'brakeman'
end

gem 'simplecov', require: false  # TODO shouldn't be here; need to overcome dependency from initializers/requires.rb
group :test do
  # gem 'simplecov', require: false # TODO
  gem 'webmock', require: false

  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers'
end

group :development, :staging do
  gem 'api_taster', github: 'fredwu/api_taster'
end

group :development, :test, :staging do
  gem 'faker', github: 'stympy/faker'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rollbar', '~> 0.9.6'
end
