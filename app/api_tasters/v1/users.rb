ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Update current user's information
  markdown

  put '/v1/users/:id',
    id: Examples.user.id,
    first_name: 'Homer',
    last_name: 'Simpson',
    email: 'homer@msn.com',
    mobile: '777-888-999-0',
    locale: 'fr',
    google_registration_id: 'google_registration_id',
    authentication_token: Examples.user.authentication_token
end
