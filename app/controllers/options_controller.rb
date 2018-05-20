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
    
  end

  def add_learning_language(language)

  end
end
