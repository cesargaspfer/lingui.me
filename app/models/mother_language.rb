class MotherLanguage < ApplicationRecord
  belongs_to :user
  has_one :language
end
