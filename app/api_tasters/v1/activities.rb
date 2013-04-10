ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Show activities applicable to a friend
  markdown

  get '/v1/activities',
    threshold_id: Examples.threshold.id,
    authentication_token: Examples.user.authentication_token
end
