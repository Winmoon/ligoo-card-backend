class ApiController < UserController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]


  def establishments
    @establishments = current_user.establishments.group_by{|i| i}.map{|k,v| [k, v.count] }
  end

  def near_establishments
    @establishments = Establishment.near([params[:latitude], params[:longitude]], 50, {:units => :km})
  end

  def news
    @news = News.order('created_at desc').paginate(:page => params[:page], :per_page => 1)
  end

  private
    def set_establishment
      @establishment = current_user.establishments.find(params[:id])
    end

    def establishment_params
      params.require(:establishment).permit(:name, :address, :description, :phone, :latitude, :longitude, :logo, :email, :password, :password_confirmation)
    end
end
