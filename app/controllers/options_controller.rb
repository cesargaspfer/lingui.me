class OptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    mother_languages = MotherLanguage.where(:user => @user)
    @mother_languages = Array.new
    mother_languages.each  do |idiom|
      @mother_languages.push(idiom.language)
    end
    learning_languages = LearningLanguage.where(:user => @user)
    @learning_languages = Array.new
    learning_languages.each do |idiom|
      @learning_languages.push(idiom.language)
    end
    @available_languages = Language.all
  end

  def create
    # @count = 0
    # @available_languages.each do |language|
    #   if(params["teach#{@count}".to_sym])
    #     if !@mother_languages.include? language
    #       add_mother_language language
    #     end
    #   else
    #     if @mother_languages.include? language
    #       remove_mother_language language
    #     end
    #   end
    # end
  end

  # def add_mother_language(language)
  #   @user = User.find_by(:id => current_user.id)
  #   @language = Language.find_by(:id => language.id)
  #   newLanguage = MotherLanguage.new(user: @user, language: @language)
  #   newLanguage.save!
  # end
  # def remove_mother_language(language)
  #   @user = User.find_by(:id => current_user.id)
  #   @language = Language.find_by(:id => language.id)
  #   newLanguage = MotherLanguage.new(user: @user, language: @language)
  #   newLanguage.save!
  # end
end
