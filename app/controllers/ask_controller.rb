class AskController < ApplicationController
  def index
    @post = Post.new
    @learningLanguage = LearningLanguage.where(:user => current_user.id)
    @motherLanguage = MotherLanguage.where(:user => current_user.id)
  end

  def create
    params[:ask]['user_id'] = current_user.id
    params[:ask]['upvotes'] = 0
    # render plain: params[:ask].inspect
    @post = Post.new(aks_params)


    respond_to do |format|
      if @post.save
        bookmark = Bookmark.new(user_id: current_user.id, post_id: @post.id)
        bookmark.save!
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def aks_params
    params.require(:ask).permit( :difficulty, :learning_language, :mother_language, :title, :text, :upvotes, :user_id)
  end

end
