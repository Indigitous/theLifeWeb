ApiTaster::RouteCollector.route do
  desc <<-markdown.strip_heredoc
    ## List posts
  markdown

  get '/v1/posts'

  desc <<-markdown.strip_heredoc
    ## Show post

    * `:id` - post ID
  markdown

  get '/v1/posts/:id',
    id: Examples.post.id
end
