class LearnController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.where(:learning_language => LearningLanguage.where(:user => current_user.id).pluck(:language), :mother_language => MotherLanguage.where(:user => current_user.id).pluck(:language))
  end
end
