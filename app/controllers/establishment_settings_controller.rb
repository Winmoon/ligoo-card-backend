class EstablishmentSettingsController < EstablishmentController
  before_action :set_establishment

  def index

  end

  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to establishment_settings_path, notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_establishment
    @establishment = current_establishment
  end

  def establishment_params
    params.require(:establishment).permit(:name, :address, :description, :phone, :latitude, :longitude, :logo, :cover)
  end
end
