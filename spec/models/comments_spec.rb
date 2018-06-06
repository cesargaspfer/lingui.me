require 'rails_helper'
RSpec.describe Comment, type: :model do
    it 'is valid with valid attributes' do
        comment = build_stubbed(:comment)
        expect(comment).to be_valid
    end
    it 'is not valid without text' do
        comment = build_stubbed(:comment)
        comment.text = nil
        expect(comment).not_to be_valid
    end
end
