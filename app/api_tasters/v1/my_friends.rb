ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## Show user's friends
  markdown

  get '/v1/my_friends',
    timestamp: Time.now.to_i,
    authentication_token: Examples.user.authentication_token
end
