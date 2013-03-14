TheLifeWeb::Application.routes.draw do
  namespace :v1 do
  end
  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine