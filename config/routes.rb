TheLifeWeb::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post('v1/authenticate', to: 'v1/sessions#create', defaults: { format: :json })
  end

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine
