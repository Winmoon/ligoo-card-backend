class EstablishmentSettingsController < EstablishmentController
  before_action :set_establishment

  def index

  end

  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to (params[:redirect_to].present? ? params[:redirect_to] : establishment_settings_path), notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html do
          if params[:redirect_to].present?
            redirect_to params[:redirect_to], alert: @establishment.errors.first[1]
          else
            render action: 'index'
          end


        end
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_establishment
    @establishment = current_establishment
  end

  def establishment_params
    params.require(:establishment).permit(:name, :address, :description, :phone, :latitude, :longitude, :logo, :cover, :daily_point_limit, :fidelity_card)
  end
end
