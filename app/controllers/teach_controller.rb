class TeachController < ApplicationController
  before_action :authenticate_user!
  def index
    @contagem = 0
    @posts = Post.where(:learning_language => MotherLanguage.where(:user => current_user.id).pluck(:language), :mother_language => MotherLanguage.where(:user => current_user.id).pluck(:language))
  end
end
