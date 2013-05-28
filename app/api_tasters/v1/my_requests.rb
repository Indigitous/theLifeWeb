ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## Get request sent to me and my groups, ordered by request id
  markdown

  get '/v1/my_requests',
    authentication_token: Examples.invited_user.authentication_token
end
