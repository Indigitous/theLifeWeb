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

  desc <<-markdown.strip_heredoc
    ## Handle an existing request to join a group

    * required params: `user_id`, `accept=true|false`
  markdown

  post "/v1/requests/:id/process",
    id: Examples.invite_request.id,
    user_id: Examples.invited_user.id,
    accept: true,
    authentication_token: Examples.invited_user.authentication_token
end
