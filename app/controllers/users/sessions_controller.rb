class Users::SessionsController < Devise::SessionsController

  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }
  before_filter :authenticate_user!

  layout 'sign_in'
end
