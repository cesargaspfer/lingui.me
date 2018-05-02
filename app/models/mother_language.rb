class MotherLanguage < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: { scope: :language }
end
