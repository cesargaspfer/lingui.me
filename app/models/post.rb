class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :difficulty
  validates_presence_of :learning_language
  validates_presence_of :mother_language
  validates_presence_of :title
  validates_presence_of :text
end
