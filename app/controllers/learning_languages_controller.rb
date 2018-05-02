class LearningLanguagesController < ApplicationController
  before_action :set_learning_language, only: [:show, :edit, :update, :destroy]

  # GET /learning_languages
  # GET /learning_languages.json
  def index
    @learning_languages = LearningLanguage.all
  end

  # GET /learning_languages/1
  # GET /learning_languages/1.json
  def show
  end

  # GET /learning_languages/new
  def new
    @learning_language = LearningLanguage.new
  end

  # GET /learning_languages/1/edit
  def edit
  end

  # POST /learning_languages
  # POST /learning_languages.json
  def create
    @learning_language = LearningLanguage.new(learning_language_params)

    respond_to do |format|
      if @learning_language.save
        format.html { redirect_to @learning_language, notice: 'Learning language was successfully created.' }
        format.json { render :show, status: :created, location: @learning_language }
      else
        format.html { render :new }
        format.json { render json: @learning_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_languages/1
  # PATCH/PUT /learning_languages/1.json
  def update
    respond_to do |format|
      if @learning_language.update(learning_language_params)
        format.html { redirect_to @learning_language, notice: 'Learning language was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_language }
      else
        format.html { render :edit }
        format.json { render json: @learning_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_languages/1
  # DELETE /learning_languages/1.json
  def destroy
    @learning_language.destroy
    respond_to do |format|
      format.html { redirect_to learning_languages_url, notice: 'Learning language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_language
      @learning_language = LearningLanguage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_language_params
      params.require(:learning_language).permit(:user_id, :language)
    end
end
