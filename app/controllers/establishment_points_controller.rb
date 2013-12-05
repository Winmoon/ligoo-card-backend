class EstablishmentPointsController < EstablishmentController
  def index
    @points = current_establishment.points.order('updated_at desc').paginate(:page => params[:page], :per_page => 30)
  end

end
