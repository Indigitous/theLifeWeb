TheLifeWeb::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :v1, defaults: { format: :json } do
    # Devise
    #
    devise_for :users, only: [], singular: :user

    devise_scope :user do
      post('/authenticate', to: 'sessions#create')
      post('/register', to: 'registrations#create')
    end

    resources :friends, only: [:create]
    resources :events, only: [:create]
    resources :my_events, only: [:index]
    resources :groups, only: [:create, :index] do
      resources :users, only: [:index]
    end
    resources :invite_requests, only: [:create], path: 'requests'
    resources :my_invite_requests, only: [:index], path: 'my_requests'
  end

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine
