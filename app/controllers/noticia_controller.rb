class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy]

  # TODO hecho para salvar error en pruebas
  def authenticate
  end

  # GET /noticia
  def index
    @noticia = Noticium.all
  end

  # GET /noticia/1
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
  def create
    @noticium = Noticium.new(noticium_params)

    respond_to do |format|
      if @noticium.save
        format.html { redirect_to @noticium, notice: 'Noticium was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /noticia/1
  def update
    respond_to do |format|
      if @noticium.update(noticium_params)
        format.html { redirect_to @noticium, notice: 'Noticium was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /noticia/1
  def destroy
    @noticium.destroy
    respond_to do |format|
      format.html { redirect_to noticia_url }
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
