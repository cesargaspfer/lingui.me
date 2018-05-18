class OptionsController < ApplicationController
  before_action :authenticate_user!

  def me
    @user = current_user
    @mother_languages = LearningLanguage.find_by(:user => @user)
    @learning_languages = LearningLanguage.where(:user => @user)
    @available_languages = Language.where(:user => @user)
  end
end
