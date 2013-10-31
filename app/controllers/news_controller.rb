class NewsController < EstablishmentController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = current_establishment.news.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  def new
    @news = current_establishment.news.new
  end

  def edit
  end

  def create
    @news = current_establishment.news.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_index_path, notice: t('messages.create.success') }
        format.json { render action: 'show', status: :created, location: @news }
      else
        format.html { render action: 'new' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to news_index_path, notice: t('messages.update.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end

  private
    def set_news
      @news = current_establishment.news.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:news)
    end
end
