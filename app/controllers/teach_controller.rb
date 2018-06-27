class TeachController < ApplicationController
  before_action :authenticate_user!
  def index
    @motherLanguage = Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
    if @motherLanguage.count == 0
     redirect_to options_path, notice: t('missing_lang')
    end
    @contagem = 0
    @posts = Post.where(:learning_language => @motherLanguage,
                        :mother_language   => @motherLanguage
                        ).includes(:user).order("created_at DESC")
  end
end
