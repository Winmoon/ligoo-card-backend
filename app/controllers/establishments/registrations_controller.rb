class Establishments::RegistrationsController < Devise::RegistrationsController

  layout 'establishment'

  def create
  end

  def establishment_params
    params.require(:establishment).permit(:name, :address, :description, :phone, :latitude, :longitude, :logo, :cover, :email, :password, :password_confirmation, :daily_point_limit, :share_points, :plan)
  end
end