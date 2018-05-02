class MotherLanguagesController < ApplicationController
  before_action :set_mother_language, only: [:show, :edit, :update, :destroy]

  # GET /mother_languages
  # GET /mother_languages.json
  def index
    @mother_languages = MotherLanguage.all
  end

  # GET /mother_languages/1
  # GET /mother_languages/1.json
  def show
  end

  # GET /mother_languages/new
  def new
    @mother_language = MotherLanguage.new
  end

  # GET /mother_languages/1/edit
  def edit
  end

  # POST /mother_languages
  # POST /mother_languages.json
  def create
    @mother_language = MotherLanguage.new(mother_language_params)

    respond_to do |format|
      if @mother_language.save
        format.html { redirect_to @mother_language, notice: 'Mother language was successfully created.' }
        format.json { render :show, status: :created, location: @mother_language }
      else
        format.html { render :new }
        format.json { render json: @mother_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mother_languages/1
  # PATCH/PUT /mother_languages/1.json
  def update
    respond_to do |format|
      if @mother_language.update(mother_language_params)
        format.html { redirect_to @mother_language, notice: 'Mother language was successfully updated.' }
        format.json { render :show, status: :ok, location: @mother_language }
      else
        format.html { render :edit }
        format.json { render json: @mother_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mother_languages/1
  # DELETE /mother_languages/1.json
  def destroy
    @mother_language.destroy
    respond_to do |format|
      format.html { redirect_to mother_languages_url, notice: 'Mother language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mother_language
      @mother_language = MotherLanguage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mother_language_params
      params.require(:mother_language).permit(:user_id, :languages)
    end
end
