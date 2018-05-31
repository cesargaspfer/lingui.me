class TeachController < ApplicationController
  before_action :authenticate_user!
  def index
    @contagem = 0
    @posts = Post.where(:learning_language => Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom),
                        :mother_language   => Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
                        ).includes(:user)
  end
end
