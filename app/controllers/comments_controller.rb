class CommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  def change_upvote
    comment = Comment.find(params[:id])
    acp = AuthorCommentPost.find_by(:comment_id => comment.id)
    post = Post.find_by(:id => acp.post.id)

    # Updates the upvoted comments count of post
    if comment.upvoted == false
      post.upvotes += 1
    else
      post.upvotes -= 1
    end

    comment.upvoted = !comment.upvoted # flop the status
    comment.save
    post.save
    redirect_to post_path(post)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    params[:status]
    if params[:text].blank?
      redirect_to post_path(params[:post_id]), notice: t('comment_mis')
    else
      @comment = Comment.new(text: params[:text], upvoted: false)
      @comment.save!

      @user = User.find_by(:id => params[:user_id])
      @post = Post.find_by(:id => params[:post_id])

      @author_comment = AuthorCommentPost.new(user: @user, post: @post, comment: @comment)
      @author_comment.save!
      redirect_to @post, notice: t('successfully_commented')
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: t('successfully_commented') }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if AuthorCommentPost.where(user_id: current_user, post_id: params[:post_id], comment_id: params[:comment_id]).count > 0
      AuthorCommentPost.find_by(user_id: current_user, post_id: params[:post_id], comment_id: params[:comment_id]).destroy
      Comment.find_by(id: params[:comment_id]).destroy
    end
    redirect_to post_path(id: params[:post_id]), notice: t('successfully_comment_del')

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:upvotes, :text)
    end
end
