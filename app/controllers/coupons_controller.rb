class CouponsController < EstablishmentController

  layout "ajax"

  before_action :set_coupon, only: [:show, :check]


  def index
    @coupons = current_establishment.coupons
  end

  def show
  end

  def check
    @coupon.check
  end

  private

    def set_coupon
      begin
        @coupon = current_establishment.coupons.find(params[:id])
      rescue
      end
    end
end
