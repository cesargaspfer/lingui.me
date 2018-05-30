class OptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    get_mother_languages(@user)
    get_learning_languages(@user)
    @available_languages = Language.all
  end

  def create
    @count = 0
    @available_languages = Language.all
    get_mother_languages(@current_user)
    get_learning_languages(@current_user)
    @available_languages.each do |language|
      if(params["teach#{@count}".to_sym] == "1")
        add_mother_language(language)
      else
        remove_mother_language(language)
      end

      if(params["learn#{@count}".to_sym] == "1")
        add_learning_language(language)
      else
        remove_learning_language(language)
      end
      @count = @count+1
    end
    redirect_to options_url
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
    newLanguage = MotherLanguage.new(user: current_user, language: language)
    newLanguage.save!
  end

  def remove_mother_language(language)
    motherLanguage = MotherLanguage.find_by(user: current_user, language: language)
    if(motherLanguage != nil)
      motherLanguage.destroy
    end
  end

  def add_learning_language(language)
    newLanguage = LearningLanguage.new(user: current_user, language: language)
    newLanguage.save!
  end
  def remove_learning_language(language)
    learningLanguage = LearningLanguage.find_by(user: current_user, language: language)
    if(learningLanguage != nil)
      learningLanguage.destroy
    end
  end
end
