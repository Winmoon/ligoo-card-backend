class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }

  def facebook

    puts "cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in(@user)

      render :status => 200, :json => @user
    else
      render :status => 401, :json => { :errors => alert }
    end
  end

  #def facebook
  #  puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx'
  #  puts request.env["omniauth.auth"]
  #
  #  # You need to implement the method below in your model (e.g. app/models/user.rb)
  #  @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
  #
  #  if @user.persisted?
  #    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #  else
  #    session["devise.facebook_data"] = request.env["omniauth.auth"]
  #    redirect_to new_user_registration_url
  #  end
  #end
end