ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List all categories including activity ids
  markdown

  get '/v1/categories',
    authentication_token: Examples.user.authentication_token
end
