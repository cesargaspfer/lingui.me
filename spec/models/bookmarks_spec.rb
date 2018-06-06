require 'rails_helper'
RSpec.describe Bookmark, type: :model do
    it 'is valid with valid attributes' do
        bookmark = build_stubbed(:bookmark)
        expect(bookmark).to be_valid
    end
    it 'is not valid without user' do
        bookmark = build_stubbed(:bookmark)
        bookmark.user = nil
        expect(bookmark).not_to be_valid
    end
    it 'is not valid without post' do
        bookmark = build_stubbed(:bookmark)
        bookmark.post = nil
        expect(bookmark).not_to be_valid
    end
end
