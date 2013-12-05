class AdminController < ApplicationController

  before_filter :authenticate_admin!

  def index
  end

  def show
    @establishment = Establishment.find(params[:id])
  end

end
