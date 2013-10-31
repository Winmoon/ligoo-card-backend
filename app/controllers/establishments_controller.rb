class EstablishmentsController < AdminController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]

  def index
    @establishments = Establishment.all
  end

  def show
  end

  def new
    @establishment = Establishment.new
  end

  def edit
  end

  def create
    @establishment = Establishment.new(establishment_params)

    respond_to do |format|
      if @establishment.save
        format.html { redirect_to establishments_path, notice: t('messages.create.success') }
        format.json { render action: 'show', status: :created, location: @establishment }
      else
        format.html { render action: 'new' }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to establishments_path, notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @establishment.destroy
    respond_to do |format|
      format.html { redirect_to establishments_url }
      format.json { head :no_content }
    end
  end

  private
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    def establishment_params
      params.require(:establishment).permit(:name, :address, :description, :phone, :latitude, :longitude, :logo, :email, :password, :password_confirmation)
    end
end
