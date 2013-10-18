class LostDogController < ApplicationController
  # TODO hecho para salvar error en pruebas
  def authenticate
  end

  # GET /lost_dog
  def index
    @lostdog = LostDog.all
  end

  # GET /lost_dog/1
  def show
  end

  # GET /lost_dog/new
  def new
    @lostdog = LostDog.new
  end

  # GET /lost_dog/1/edit
  def edit
  end

  # POST /lost_dog
  def create
    @lostdog = LostDog.new(lostdog_params)

    respond_to do |format|
      if @lostdog.save
        format.html { redirect_to @lostdog, notice: 'LostDog was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /lost_dog/1
  def update
    respond_to do |format|
      if @LostDog.update(lostdog_params)
        format.html { redirect_to @lostdog, notice: 'LostDog was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /lost_dog/1
  def destroy
    @lostdog.destroy
    respond_to do |format|
      format.html { redirect_to lost_dog_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lostdog
      @lostdog = LostDog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lostdog_params
      params.require(:LostDog).permit(:title, :content)
    end
end