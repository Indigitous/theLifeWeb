ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## Visitor signs in
  markdown

  post '/v1/authenticate',
    :email => Examples.user.email,
    :password => Examples.password
end
