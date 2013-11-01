class PointsController < UserController
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  def index
    @points = current_user.points.all
  end

  def show
  end

  def new
    @point = current_user.points.new
  end

  def edit
  end

  def create
    @point = current_user.points.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to points_index_path, notice: t('messages.create.success') }
        format.json { render action: 'show', status: :created, location: @point }
      else
        format.html { render action: 'new' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to points_index_path, notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_index_url }
      format.json { head :no_content }
    end
  end

  private
    def set_point
      @point = current_user.points.find(params[:id])
    end

    def point_params
      params.require(:point).permit(:establishment_id, :point_type)
    end
end
