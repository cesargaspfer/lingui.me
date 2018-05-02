class AuthorCommentPostsController < ApplicationController
  before_action :set_author_comment_post, only: [:show, :edit, :update, :destroy]

  # GET /author_comment_posts
  # GET /author_comment_posts.json
  def index
    @author_comment_posts = AuthorCommentPost.all
  end

  # GET /author_comment_posts/1
  # GET /author_comment_posts/1.json
  def show
  end

  # GET /author_comment_posts/new
  def new
    @author_comment_post = AuthorCommentPost.new
  end

  # GET /author_comment_posts/1/edit
  def edit
  end

  # POST /author_comment_posts
  # POST /author_comment_posts.json
  def create
    @author_comment_post = AuthorCommentPost.new(author_comment_post_params)

    respond_to do |format|
      if @author_comment_post.save
        format.html { redirect_to @author_comment_post, notice: 'Author comment post was successfully created.' }
        format.json { render :show, status: :created, location: @author_comment_post }
      else
        format.html { render :new }
        format.json { render json: @author_comment_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_comment_posts/1
  # PATCH/PUT /author_comment_posts/1.json
  def update
    respond_to do |format|
      if @author_comment_post.update(author_comment_post_params)
        format.html { redirect_to @author_comment_post, notice: 'Author comment post was successfully updated.' }
        format.json { render :show, status: :ok, location: @author_comment_post }
      else
        format.html { render :edit }
        format.json { render json: @author_comment_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_comment_posts/1
  # DELETE /author_comment_posts/1.json
  def destroy
    @author_comment_post.destroy
    respond_to do |format|
      format.html { redirect_to author_comment_posts_url, notice: 'Author comment post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_comment_post
      @author_comment_post = AuthorCommentPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_comment_post_params
      params.require(:author_comment_post).permit(:user_id, :comment_id, :post_id)
    end
end
