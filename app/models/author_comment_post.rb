class AuthorCommentPost < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :post
end
