class LostDogController < ApplicationController
   include Gmaps4rails::ActsAsGmappable
   before_action :set_lostdog, only: [:destroy]
  # TODO hecho para salvar error en pruebas
  def authenticate
  end

  def description
    @dog = LostDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end 

  # GET /lost_dog
  def index
    @lostdogs = LostDog.all
  end

  # GET /lost_dog/1
  def show
    @lostdog = LostDog.find(params[:id])
    @markers = @lostdog.to_gmaps4rails
    possible_owners = DogPossibleOwner.find_by dog_id: params[:id]
    @marby_is_my_dog_button = true
    @is_my_dog_button = false
    if possible_owners
      @is_my_dog_button = true
      @marby_is_my_dog_button = false
    end    
    if @lostdog.user == current_user
      @is_my_dog_button = false
      @marby_is_my_dog_button = false
    end        
  end

  # GET /lost_dog/new
  def new
    @dog = LostDog.new
  end

  # GET /lost_dog/1/edit
  def edit
  end

  # POST /lost_dog
  def create
    @dog = LostDog.new(lostdog_params)
    @dog.user = current_user
    if params[:address].present?
      # coords = Gmaps4rails.geocode(params[:address])
      # @dog.latitude = coords[0][:lat] || -34.5843 
      # @dog.longitude = coords[0][:lng] || -58.4843
      @dog.latitude = -34.5843 
      @dog.longitude = -58.4843
    end

    if @dog.save
      redirect_to @dog, notice: 'La publicación de la mascota encontrada
         ha sido exitosa. Deseamos que aparezca pronto el dueño.'
    else
      render action: 'new'
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
      format.html { redirect_to lost_dog_index_path }
    end
  end

  def description
    @dog = LostDog.find params[:id]
    @markers = @dog.to_gmaps4rails
    render :template => 'shared/dog_description'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lostdog
      @lostdog = LostDog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lostdog_params
      params.require(:lostdog).permit(:age, :breed_id, :color, :description, :address, :image)
    end
    
end