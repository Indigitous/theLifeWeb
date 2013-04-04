ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Creating an invite request
  markdown

  post '/v1/requests',
    group_id: Examples.user_owned_group.id,
    email: FactoryGirl.generate(:email),
    authentication_token: Examples.user.authentication_token
end
