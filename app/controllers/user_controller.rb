class UserController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def index

  end

end
