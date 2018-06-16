class LearnController < ApplicationController
  before_action :authenticate_user!

  def index
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

    @posts = Post.where(:learning_language => Language.find(LearningLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom),
                        :mother_language   => Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
                        ).includes(:user).order("created_at DESC")
  end


end
