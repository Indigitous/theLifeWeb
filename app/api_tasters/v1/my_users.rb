ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Get user profile

    `:id` must be current user or one of
    the users in his/her groups.
  markdown

  get '/v1/my_users/:id',
    id: Examples.user.id,
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Update user's image

    `:id` must be current user
  markdown

  post '/v1/my_users/:id/image',
    id: Examples.user.id,
    image: :file,
    authentication_token: Examples.user.authentication_token
end
