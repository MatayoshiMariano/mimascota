class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy]

  # GET /noticia
  # GET /noticia.json
  def index
    @noticia = Noticium.all
  end

  # GET /noticia/1
  # GET /noticia/1.json
  def show
  end

  # GET /noticia/new
  def new
    @noticium = Noticium.new
  end

  # GET /noticia/1/edit
  def edit
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @noticium = Noticium.new(noticium_params)

    respond_to do |format|
      if @noticium.save
        format.html { redirect_to @noticium, notice: 'Noticium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @noticium }
      else
        format.html { render action: 'new' }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticia/1
  # PATCH/PUT /noticia/1.json
  def update
    respond_to do |format|
      if @noticium.update(noticium_params)
        format.html { redirect_to @noticium, notice: 'Noticium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @noticium.destroy
    respond_to do |format|
      format.html { redirect_to noticia_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticium
      @noticium = Noticium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticium_params
      params.require(:noticium).permit(:title, :content)
    end
end
