ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Update current user information
  markdown

  put '/v1/users/:id',
    id: Examples.user.id,
    first_name: 'Eduardo',
    authentication_token: Examples.user.authentication_token
end
