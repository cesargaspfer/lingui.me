class OptionsController < ApplicationController
  before_action :authenticate_user!

  def options
    @user = current_user
    @user_mother_languages = LearningLanguage.find_by(:user => @user)
    @user_learning_languages = LearningLanguage.where(:user => @user)
    @available_languages = Language.all
  end

  def add_learning_language(language)

  end
end
