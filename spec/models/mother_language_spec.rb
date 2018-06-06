require 'rails_helper'
RSpec.describe MotherLanguage, type: :model do
    it 'is valid with valid attributes' do
        motherLanguage = build_stubbed(:mother_language)
        expect(motherLanguage).to be_valid
    end
    it 'is not valid without language' do
        motherLanguage = build_stubbed(:mother_language)
        motherLanguage.language = nil
        expect(motherLanguage).not_to be_valid
    end

    it 'is not valid without user' do
        motherLanguage = build_stubbed(:mother_language)
        motherLanguage.user = nil
        expect(motherLanguage).not_to be_valid
    end
end
