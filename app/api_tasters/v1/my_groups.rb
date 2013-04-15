ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
      ## Show user's groups
    markdown

    get '/v1/my_groups',
      authentication_token: Examples.user.authentication_token
end
