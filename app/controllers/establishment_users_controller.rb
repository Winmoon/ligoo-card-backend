class EstablishmentUsersController < EstablishmentController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = current_establishment.users.search(params[:search]).group_by{|i| i}.map{|k,v| [k, v.count] }

    respond_to do |format|
      format.html
      format.csv do
        x = CSV.generate do |csv|
          @users.collect{|u| u[0]}.each do |user|
            csv << [user.name, user.email, user.phone, user.gender, l(user.birth_date.to_date, format: :default), l(user.created_at.to_date, format: :default)]
          end
        end

        send_data x

      end
    end
  end

end
