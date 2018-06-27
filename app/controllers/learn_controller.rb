class LearnController < ApplicationController
  before_action :authenticate_user!

  def index
    @learningLanguage = Language.find(LearningLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
    @motherLanguage = Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
    if @learningLanguage.count == 0 || @motherLanguage.count == 0
     redirect_to options_path, notice: t('missing_lang')
    end
    vars = request.query_parameters
    @dif = vars['dif']
    if(@dif.blank?)
      @dif = 1
    end
    @dif = @dif.to_i
    if(@dif > 3)
      @dif = 3
    elsif @dif < 0
      @dif = 0
    end

    @posts = Post.where(:learning_language => @learningLanguage,
                        :mother_language   => @motherLanguage
                        ).includes(:user).order("created_at DESC")
  end


end
