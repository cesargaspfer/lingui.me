class OptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    get_mother_languages(@user)
    get_learning_languages(@user)
    @available_languages = Language.all
  end

  def create
    # @count = 0
    # @available_languages = Language.all
    # get_mother_languages(@current_user)
    # get_learning_languages(@current_user)
    # @available_languages.each do |language|
    #   if(params["teach#{@count}".to_sym] == true)
    #     if !@mother_languages.include?(language)
    #       add_mother_language language
    #     end
    #   else
    #     if @mother_languages.include?(language)
    #       remove_mother_language language
    #     end
    #   end
    #
    #   if(params["learn#{@count}".to_sym] == true)
    #     if !@learning_languages.include?(language)
    #       add_learning_language language
    #     end
    #   else
    #     if @learning_languages.include? language
    #       remove_learning_language language
    #     end
    #   end
    # end
  end

  def get_mother_languages(user)
    mother_languages = MotherLanguage.where(:user => user)
    @mother_languages = Array.new
    mother_languages.each  do |idiom|
      @mother_languages.push(idiom.language)
    end
  end

  def get_learning_languages(user)
    learning_languages = LearningLanguage.where(:user => user)
    @learning_languages = Array.new
    learning_languages.each do |idiom|
      @learning_languages.push(idiom.language)
    end
  end

  def add_mother_language(language)
    @user = User.find_by(:id => current_user.id)
    @language = Language.find_by(:id => language.id)
    newLanguage = MotherLanguage.new(user: @user, language: @language)
    newLanguage.save!
  end
  def remove_mother_language(language)
    @user = User.find_by(:id => current_user.id)
    @language = Language.find_by(:id => language.id)

    language = MotherLanguage.find_by(user: @user, language: @language)
    language.destroy
  end

  def add_learning_language(language)
    @user = User.find_by(:id => current_user.id)
    @language = Language.find_by(:id => language.id)
    newLanguage = LearningLanguage.new(user: @user, language: @language)
    newLanguage.save!
  end
  def remove_learning_language(language)
    @user = User.find_by(:id => current_user.id)
    @language = Language.find_by(:id => language.id)

    language = LearningLanguage.find_by(user: @user, language: @language)
    language.destroy
  end
end
