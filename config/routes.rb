TheLifeWeb::Application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    # Devise
    #
    devise_for :users, only: [], singular: :user

    devise_scope :user do
      post('/authenticate', to: 'sessions#create')
    end

    resources :friends, only: [:create]
  end

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine
