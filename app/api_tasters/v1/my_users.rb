ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Get user profile

    `:id` must be current user or one of
    the users in his/her groups.
  markdown

  get '/v1/my_users/:id',
    id: Examples.user.id,
    authentication_token: Examples.user.authentication_token
end
