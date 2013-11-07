class EstablishmentController < ApplicationController

  layout :set_layout

  def set_layout
    if action_name == 'index'
      "establishment"
    else
      "ajax"
    end
  end

  before_filter :authenticate_establishment!

  def index

  end

  def show
    @coupon = current_establishment.coupons.find(params[:id])
  end

end
