require 'rails_helper'
RSpec.describe Language, type: :model do
    it 'is valid with valid attributes' do
        language = build_stubbed(:language)
        expect(language).to be_valid
    end
    it 'is not valid without idiom' do
        language = build_stubbed(:language)
        language.idiom = nil
        expect(language).not_to be_valid
    end
end
