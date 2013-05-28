ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## Creating a friend
  markdown

  post '/v1/friends',
    FactoryGirl.attributes_for(:friend, threshold_id: Examples.threshold.id)
      .merge(authentication_token: Examples.user.authentication_token)

  desc <<-markdown.strip_heredoc
    ## Update a friend
  markdown

  put '/v1/friends/:id',
    id: Examples.user_friend.id,
    threshold_id: Examples.user_friend.threshold.id,
    email: '',
    mobile: '',
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Deleting a friend
  markdown

  delete '/v1/friends/:id',
    id: Examples.user_friend.id,
    authentication_token: Examples.user.authentication_token
end
