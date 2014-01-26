
class LostDogController < ApplicationController
   include Gmaps4rails::ActsAsGmappable
  # TODO hecho para salvar error en pruebas
  def authenticate
  end

  # GET /lost_dog
  def index
    @lostdogs = LostDog.all
  end

  # GET /lost_dog/1
  def show
    @lostdog = LostDog.find(params[:id])
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

      coords = Gmaps4rails.geocode(params[:address])
      @lostdog.latitude = coords[0][:lat]
      @lostdog.longitude = coords[0][:lng]
      @lostdog.user = current_user

      if @lostdog.save
        format.html { redirect_to @lostdog, notice: 'La publicación de su mascota perdida
         ha sido exitosa. Deseamos que la recupere pronto.' }
      else
        Rails.logger.error(current_user)        
        Rails.logger.error(@lostdog.errors.full_messages.join('\n'))        
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
      params.require(:lostdog).permit(:name, :age, :breed, :color, :description, :address)
    end

  def description
    @dog = LostDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

end