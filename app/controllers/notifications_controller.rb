class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    vars = request.query_parameters
    allposts = AuthorCommentPost.where(post_id: Bookmark.where(:user_id => current_user.id).pluck(:post_id)).includes(:user, :post, :comment).order("created_at DESC")

    @pg = vars['pg']
    if(@pg.blank?)
      @pg = 0
    end
    @pg = @pg.to_i
    if @pg < 0
      @pg = 0
    end
    @acp = []
    i = @pg * 7
    total = allposts.count
    @primeira_pagina = false
    if @pg == 0 || total < 6
      @primeira_pagina = true
    end
    @ultima_pagina = false
    if total >= i + 7
      for j in 0..6
        @acp.push(allposts[i])
        i += 1
      end
    else
      while i < total
        @acp.push(allposts[i])
        i += 1
      end
      @ultima_pagina = true
    end
  end
end
