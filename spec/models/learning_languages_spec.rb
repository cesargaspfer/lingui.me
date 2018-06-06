require 'rails_helper'
RSpec.describe LearningLanguage, type: :model do
    it 'is valid with valid attributes' do
        learningLanguage = build_stubbed(:learning_language)
        expect(learningLanguage).to be_valid
    end
    it 'is not valid without language' do
        learningLanguage = build_stubbed(:learning_language)
        learningLanguage.language = nil
        expect(learningLanguage).not_to be_valid
    end

    it 'is not valid without user' do
        learningLanguage = build_stubbed(:learning_language)
        learningLanguage.user = nil
        expect(learningLanguage).not_to be_valid
    end
end
