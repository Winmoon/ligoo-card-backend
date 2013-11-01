class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }
  http_basic_authenticate_with name: 'ligoocard', password: 'uyP4RnNMGe4coOm6kIcfAt9E1S8AHK9wwHqPZO9xz7I', if: Proc.new { |c| c.request.format == 'application/json' }

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :provider, :uid)
  end
end
