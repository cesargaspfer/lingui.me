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

    allposts = Post.where(:learning_language => @learningLanguage,
                        :mother_language   => @motherLanguage
                        ).includes(:user).order("created_at DESC")

    vars = request.query_parameters
    @pg = vars['pg']
    if(@pg.blank?)
      @pg = 0
    end
    @pg = @pg.to_i
    if @pg < 0
      @pg = 0
    end
    @posts = []
    @primeira_pagina = true
    @ultima_pagina = true
    total = allposts.count
    i = @pg * 5
    j = 0
    contagem = 0
    while j < total
      if AuthorCommentPost.where(:post => allposts[j]).count > 0 and allposts[j].difficulty == @dif
        if contagem >= i
          if contagem < i + 5
            @posts.push(allposts[j])
          else
            @ultima_pagina = false
            break
          end
        end
        contagem += 1
      end
      j += 1
    end
    if contagem != 0 and @pg != 0
      @primeira_pagina = false
    end
  end


end
