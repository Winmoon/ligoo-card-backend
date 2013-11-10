class EstablishmentController < ApplicationController

  layout "establishment"

  before_filter :authenticate_establishment!

  def index

  end

  def require_premium
    redirect_to establishment_index_path, alert: 'Acesso negado' if current_establishment.plan != 'premium'
  end


end
