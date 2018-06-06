require 'rails_helper'
RSpec.describe AuthorCommentPost, type: :model do
    it 'is valid with valid attributes' do
        author_comment_post = build_stubbed(:author_comment_post)
        expect(author_comment_post).to be_valid
    end
    it 'is not valid without user' do
        author_comment_post = build_stubbed(:author_comment_post)
        author_comment_post.user = nil
        expect(author_comment_post).not_to be_valid
    end
    it 'is not valid without post' do
        author_comment_post = build_stubbed(:author_comment_post)
        author_comment_post.post = nil
        expect(author_comment_post).not_to be_valid
    end
    it 'is not valid without comment' do
        author_comment_post = build_stubbed(:author_comment_post)
        author_comment_post.comment = nil
        expect(author_comment_post).not_to be_valid
    end
end
