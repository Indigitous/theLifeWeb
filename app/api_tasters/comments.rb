ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## List comments

    * `:post_id` - post ID
  markdown

  get '/v1/posts/:post_id/comments',
    post_id: Examples.post.id

  desc <<-markdown.strip_heredoc
    ## Show comment

    * `:post_id` - post ID
    * `:id` - comment ID
  markdown

  get '/v1/posts/:post_id/comments/:id',
    post_id: Examples.post.id,
    id: Examples.comment.id
end
