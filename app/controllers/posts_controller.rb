class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @id = params[:id]
    @post = Post.find_by(:id => @id)
    allacp = AuthorCommentPost.where(:post_id => @id).includes(:user, :comment)
    @bookmarked = false;
    if Bookmark.where(user_id: current_user.id, post_id: @id).count > 0
      @bookmarked = true
    end

    vars = request.query_parameters
    @pg = vars['pg']
    if(@pg.blank?)
      @pg = 0
    end
    @pg = @pg.to_i
    if @pg < -1
      @pg = 0
    end
    @acp = []
    total = allacp.count

    # First Page
    if @pg != -1
      i = @pg * 7
      @primeira_pagina = false
      if @pg == 0 || total < 4
        @primeira_pagina = true
      end
      @ultima_pagina = false
      if total >= i + 7
        for j in 0..6
          @acp.push(allacp[i])
          i += 1
        end
      else
        while i < total
          @acp.push(allacp[i])
          i += 1
        end
        @ultima_pagina = true
      end
    # Last page
    else
      @ultima_pagina = true
      @primeira_pagina = true
      if total > 7
        @primeira_pagina = false
      end

      j = total - total%7
      while j < total
        @acp.push(allacp[j])
        j += 1
      end

      @pq = (total-total%7)/7
      puts "-----------------------------------------------------------------"
      puts @pg
      puts "-----------------------------------------------------------------"
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:upvotes, :user_id, :difficulty, :learning_language, :mother_language, :title, :text)
    end
end
