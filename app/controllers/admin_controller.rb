class AdminController < ApplicationController

  before_filter :authenticate_admin!

  def index
    redirect_to admin_establishments_path
  end

end
