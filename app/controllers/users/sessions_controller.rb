class Users::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }
  layout 'sign_in'
end
