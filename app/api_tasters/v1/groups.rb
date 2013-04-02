ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Creating a group
  markdown

  post '/v1/groups',
    FactoryGirl.attributes_for(:group)
      .merge(authentication_token: Examples.user.authentication_token)

  desc <<-markdown.strip_heredoc
    ## Get all groups in the app
  markdown

  get '/v1/groups',
    authentication_token: Examples.user.authentication_token

end
