TheLifeWeb::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :admin do
    resources :users do
      resources :group_users
    end
    resources :groups do
      resources :group_users
    end
  end

  namespace :v1, defaults: { format: :json } do
    # Devise
    #
    devise_for :users, only: [], singular: :user

    devise_scope :user do
      post('/authenticate', to: 'sessions#create')
      post('/register', to: 'registrations#create')
      delete('/users', to: 'registrations#destroy')
    end

    resources :friends, only: [:create, :update, :destroy]
    resources :my_friends, only: [:index]

    resources :events, only: [:create] do
      resource :pledge, only: [:create]
    end

    resources :my_events, only: [:index]
    resources :groups, only: [:create, :index, :destroy] do
      resources :users, only: [:index, :destroy]
    end
    resources :my_groups, only: [:index]
    resources :my_users, only: [:show]
    resources :users, only: [:update]
    resources :invite_requests, only: [:create, :destroy], path: 'requests' do
      post :process, on: :member, to: 'invite_requests#handle'
    end
    resources :my_invite_requests, only: [:index], path: 'my_requests'
    resources :activities, only: [:index]
    resources :categories, only: [:index]

    resource :image, only: [] do
      get ':resources/:id(/:version)', to: 'images#show'
    end
  end

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end
