ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
      ## Show user's event stream
    markdown

    get '/v1/my_events',
      authentication_token: Examples.user.authentication_token,
      after: 2,
      before: 1,
      max: 20
end
