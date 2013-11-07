class EstablishmentController < ApplicationController

  layout "establishment"

  before_filter :authenticate_establishment!

  def index

  end


end
