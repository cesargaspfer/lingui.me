json.extract! author_comment_post, :id, :user_id, :comment_id, :post_id, :created_at, :updated_at
json.url author_comment_post_url(author_comment_post, format: :json)
