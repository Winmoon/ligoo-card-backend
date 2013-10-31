class PromotionsController < EstablishmentController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  def index
    @promotions = Promotion.paginate(:page => params[:page], :per_page => 1)
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def edit
  end

  def create
    @promotion = Promotion.new(promotion_params)

    respond_to do |format|
      if @promotion.save
        format.html { redirect_to promotions_path, notice: t('messages.create.success') }
        format.json { render action: 'show', status: :created, location: @promotion }
      else
        format.html { render action: 'new' }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to promotions_path, notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url }
      format.json { head :no_content }
    end
  end

  private
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(:description, :points, :valid_until)
    end
end
