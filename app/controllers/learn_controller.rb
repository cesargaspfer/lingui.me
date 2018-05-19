class LearnController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.where(:learning_language => LearningLanguage.where(:user => current_user.id), :mother_language => MotherLanguage.where(:user => current_user.id))
  end
end
