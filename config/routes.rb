TheLifeWeb::Application.routes.draw do
  namespace :v1 do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :show]
    end
  end
  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine