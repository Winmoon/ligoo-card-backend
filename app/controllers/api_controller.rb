class ApiController < UserController
  before_action :set_establishment, only: [:establishment, :like, :point]

  def establishments
    @establishments = current_user.establishments.group_by{|i| i}.map{|k,v| [k, v.count] }
  end

  def near_establishments
    @establishments = Establishment.near([params[:latitude], params[:longitude]], 50, {:units => :km})
  end

  def news
    @news = News.order('created_at desc').paginate(:page => params[:page], :per_page => 10)
  end

  def establishment

  end

  def like
    @like = current_user.likes.new({ establishment_id: @establishment.id })
    respond_to do |format|
      if @like.save
        format.json { render action: 'like', status: :created }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def coupons
    @coupons = current_user.coupons
  end

  def coupon
    @coupon = current_user.coupons.new({ promotion_id: params[:id] })

    respond_to do |format|
      if @coupon.register
        format.json { render action: 'coupon', status: :created }
      else
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  def points
    @points = current_user.points.available
  end

  def point
    @point = current_user.points.new({establishment_id: @establishment.id, point_type: params[:point_type]})

    respond_to do |format|
      if @point.save
        format.html { redirect_to points_index_path, notice: t('messages.create.success') }
        format.json { render action: 'point', status: :created, location: @point }
      else
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_establishment
      @establishment = current_user.establishments.find(params[:id])
    end
end