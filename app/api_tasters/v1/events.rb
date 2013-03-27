ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Creating an event
  markdown

  post '/v1/events',
    activity_id: Examples.activity.id,
    friend_id: Examples.user_friend.id,
    prayer_requested: false,
    authentication_token: Examples.user.authentication_token
end
