class AskController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @learningLanguage = LearningLanguage.where(:user => current_user.id)
    @motherLanguage = MotherLanguage.where(:user => current_user.id)
    if @learningLanguage.count == 0 || @motherLanguage.count == 0
     redirect_to options_path, notice: t('missing_lang')
    end
  end

  def create
    params[:ask]['user_id'] = current_user.id
    params[:ask]['upvotes'] = 0
    if params[:ask][:title].blank?
      @post = Post.new
      @learningLanguage = LearningLanguage.where(:user => current_user.id)
      @motherLanguage = MotherLanguage.where(:user => current_user.id)
      redirect_to ask_path, notice: t('missing_tit')
    elsif params[:ask][:text].blank?
      @post = Post.new
      @learningLanguage = LearningLanguage.where(:user => current_user.id)
      @motherLanguage = MotherLanguage.where(:user => current_user.id)
      redirect_to ask_path, notice: t('missing_txt')
    else
      @post = Post.new(ask_params)


      respond_to do |format|
        if @post.save
          bookmark = Bookmark.new(user_id: current_user.id, post_id: @post.id)
          bookmark.save!
            format.html { redirect_to @post, notice: t('successfully_created') }
            format.json { render :show, status: :created, location: @post }
        else
          format.html { render :index }
        end
      end
    end
  end


  def ask_params
    params.require(:ask).permit( :difficulty, :learning_language, :mother_language, :title, :text, :upvotes, :user_id)
  end

end
