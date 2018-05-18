class LearningLanguage < ApplicationRecord
  belongs_to :user
  has_one :language
  validates :user, uniqueness: { scope: :language }
end
