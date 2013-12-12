class AdminPointsController < AdminController
  def index

    @filter_param = params[:filter] || {}

    if @filter_param[:establishment_id].present?
      @points = Establishment.find(@filter_param[:establishment_id]).points.order('updated_at desc').paginate(:page => params[:page], :per_page => 30)
    else
      @points = Point.order('updated_at desc').paginate(:page => params[:page], :per_page => 30)
    end

  end

end
