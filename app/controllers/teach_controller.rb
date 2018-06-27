class TeachController < ApplicationController
  before_action :authenticate_user!
  def index
    @motherLanguage = Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
    if @motherLanguage.count == 0
     redirect_to options_path, notice: t('missing_lang')
    end
    @contagem = 0
    allposts = Post.where(:learning_language => @motherLanguage,
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
    i = @pg * 5
    total = allposts.count
    @primeira_pagina = false
    if @pg == 0 || total < 4
      @primeira_pagina = true
    end
    @ultima_pagina = false
    if total >= i + 5
      for j in 0..4
        @posts.push(allposts[i])
        i += 1
      end
    else
      while i < total
        @posts.push(allposts[i])
        i += 1
      end
      @ultima_pagina = true
    end
  end
end
