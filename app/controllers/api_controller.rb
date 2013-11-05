class ApiController < UserController
  before_action :set_establishment, only: [:establishment, :like]


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
    puts 'sdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdfsdfasdf'
    puts @establishment
    @like = current_user.likes.new({ establishment_id: @establishment.id })

    respond_to do |format|
      if @like.save
        format.json { render action: 'like', status: :created }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_establishment
      @establishment = current_user.establishments.find(params[:id])
    end

    def establishment_params
      params.require(:establishment).permit(:name, :address, :description, :phone, :latitude, :longitude, :logo, :email, :password, :password_confirmation)
    end
end
