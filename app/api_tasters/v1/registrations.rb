ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## User signs up
  markdown

  post '/v1/register', FactoryGirl.attributes_for(:user)

  desc <<-markdown.strip_heredoc
    ## Delete User from an application
  markdown

  delete '/v1/users',
    authentication_token: Examples.user.authentication_token
end
