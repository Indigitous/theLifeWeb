ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## User signs up
  markdown

  post '/v1/register', FactoryGirl.attributes_for(:user)
end
