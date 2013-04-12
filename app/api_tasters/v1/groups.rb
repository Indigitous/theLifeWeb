ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Creating a group
  markdown

  post '/v1/groups',
    FactoryGirl.attributes_for(:group)
      .merge(authentication_token: Examples.user.authentication_token)

  desc <<-markdown.strip_heredoc
    ## Delete my group
  markdown

  delete '/v1/groups/:id',
    id: Examples.user.owned_groups.first.id,
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Get all groups in the app
  markdown

  get '/v1/groups',
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Get all users in a group in the app
  markdown

  get '/v1/groups/:group_id/users',
    group_id: Examples.user.groups.first.id,
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Remove user from a group
  markdown

  delete '/v1/groups/:group_id/users/:id',
    group_id: Examples.user.groups.first.id,
    id: Examples.user.groups.first.users.first.id,
    authentication_token: Examples.user.authentication_token
end
