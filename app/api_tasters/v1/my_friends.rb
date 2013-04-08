ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Show user's event stream
  markdown

  get '/v1/my_friends',
    authentication_token: Examples.user.authentication_token
end
