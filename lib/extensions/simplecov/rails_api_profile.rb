require 'simplecov'

SimpleCov.adapters.define 'rails-api' do
  load_adapter 'rails'
  add_filter 'api_taster'
  add_filter 'examples'
  add_filter 'serializers/'
  add_group 'Admin', 'app/admin'
end
