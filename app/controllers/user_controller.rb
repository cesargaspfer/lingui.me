class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    vars = request.query_parameters
    @id = vars['id']
    if(!defined? @id)
      @id = current_user.id
    end
    @contagem = 0
    @user = User.find_by(:id => @id)
    allposts = Post.where(:user => @user).order("created_at DESC")

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
