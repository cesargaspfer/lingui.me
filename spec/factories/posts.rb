FactoryBot.define do
    factory :post do
        user
        difficulty 1
        learning_language 'alemao'
        mother_language 'ingles'
        title 'test'
        text 'required text'
    end
end
