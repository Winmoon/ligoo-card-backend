class Users::RegistrationsController < Devise::RegistrationsController
  include CorsHelper

  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }
  before_filter :authenticate_user!
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :provider, :uid)
  end
end
