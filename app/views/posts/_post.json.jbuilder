json.extract! post, :id, :upvotes, :user_id, :difficulty, :learning_language, :mother_language, :title, :text, :created_at, :updated_at
json.url post_url(post, format: :json)
