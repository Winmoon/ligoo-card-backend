class EstablishmentSettingsController < EstablishmentController
  before_action :set_establishment

  def index

  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_settings_path, notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'settings' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_establishment
      @establishment = current_establishment
    end

    def establishment_params
      params.require(:user).permit(:name, :birth_date, :gender)
    end
end
