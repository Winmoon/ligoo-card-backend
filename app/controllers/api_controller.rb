class ApiController < UserController
  before_action :set_user
  before_action :set_establishment, only: [:establishment, :like, :point]

  def establishments
    @establishments = @user.establishments.group_by{|i| i}.map{|k,v| [k, v.count] }
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
    @like = @user.likes.new({ establishment_id: @establishment.id })
    respond_to do |format|
      if @like.save
        format.json { render action: 'like', status: :created }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def coupons
    @coupons = @user.coupons
  end

  def coupon
    @coupon = @user.coupons.new({ promotion_id: params[:id] })

    respond_to do |format|
      if @coupon.register
        format.json { render action: 'coupon', status: :created }
      else
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_coupon
    @coupon = @user.coupons.find(params[:coupon_id])

    @coupon.errors.add(:promotion_id, t("activerecord.attributes.coupon.errors.not_found")) if @coupon.promotion.establishment_id != params[:id].to_i

    respond_to do |format|
      if @coupon.errors.empty? && @coupon.check
        format.json { render action: 'coupon', status: :created }
      else
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  def points
    @points = @user.points.available
  end

  def point
    @point = @user.points.new({establishment_id: @establishment.id, point_type: params[:point_type]})

    respond_to do |format|
      if @point.save
        format.json { render action: 'point', status: :created }
      else
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end


  def profile

  end

  def update_profile
    respond_to do |format|
      if @user.update(user_params)
        format.json { render action: 'profile', status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
    end


    def user_params
      params.require(:user).permit(:name, :birth_date, :gender, :phone)
    end
end
