ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## Inviting person

    * required params: `group_id`, `email` or `sms`
    * type: `INVITE`

    ## Requesting group membership

    * required params: `group_id`
    * type: `REQUEST_MEMBERSHIP`
  markdown

  post '/v1/requests',
    group_id: Examples.user_owned_group.id,
    email: FactoryGirl.generate(:email),
    sms: '',
    type: 'INVITE',
    authentication_token: Examples.user.authentication_token
end
