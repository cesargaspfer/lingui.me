class OptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    mother_languages = MotherLanguage.where(:user => @user)
    @mother_languages = Array.new
    mother_languages.each  do |language|
      @mother_languages.push(language)
    end
    learning_languages = LearningLanguage.where(:user => @user)
    @learning_languages = Array.new
    learning_languages.each do |language|
      @learning_languages.push(language)
    end
    @available_languages = Language.all
  end

  def create
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

  def add_learning_language(language)

  end
end
