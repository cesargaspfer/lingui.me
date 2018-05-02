json.extract! comment, :id, :upvotes, :text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
