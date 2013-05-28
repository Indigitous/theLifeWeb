ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## Creating a pledge
  markdown

  post '/v1/events/:event_id/pledge',
    event_id: Examples.event.id,
    authentication_token: Examples.user.authentication_token
end
