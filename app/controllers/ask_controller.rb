class AskController < ApplicationController
  def index
    @post = Post.new
    @learningLanguage = LearningLanguage.where(:user => current_user.id)
    @motherLanguage = MotherLanguage.where(:user => current_user.id)
  end
end
