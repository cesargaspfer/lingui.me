require 'rails_helper'
RSpec.describe Post, type: :model do
    it 'is valid with valid attributes' do
        post = build_stubbed(:post)
        expect(post).to be_valid
    end
    it 'is not valid without user' do
        post = build_stubbed(:post)
        post.user = nil
        expect(post).not_to be_valid
    end
    it 'is not valid without learning_language' do
        post = build_stubbed(:post)
        post.learning_language = nil
        expect(post).not_to be_valid
    end
    it 'is not valid without mother_language' do
        post = build_stubbed(:post)
        post.mother_language = nil
        expect(post).not_to be_valid
    end
    it 'is not valid without title' do
        post = build_stubbed(:post)
        post.title = nil
        expect(post).not_to be_valid
    end
    it 'is not valid without text' do
        post = build_stubbed(:post)
        post.text = nil
        expect(post).not_to be_valid
    end
    it 'is not valid without difficulty' do
        post = build_stubbed(:post)
        post.difficulty = nil
        expect(post).not_to be_valid
    end
end
