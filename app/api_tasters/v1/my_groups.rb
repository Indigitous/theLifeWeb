ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
      ## Show groups user belongs to
    markdown

    get '/v1/my_groups',
      timestamp: Time.now.to_i,
      authentication_token: Examples.user.authentication_token
end
