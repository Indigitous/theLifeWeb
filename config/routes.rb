TheLifeWeb::Application.routes.draw do
  resources :posts, only: [:index, :show]
  resources :comments, only: [:index, :show]

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine