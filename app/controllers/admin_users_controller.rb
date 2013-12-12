class AdminUsersController < AdminController

  def index

    @filter_param = params[:filter] || {}

    if @filter_param[:establishment_id].present?
      @users = Establishment.find(@filter_param[:establishment_id]).users.search(params[:search]).group_by{|i| i}.map{|k,v| [k, v.count] }
    else
      @users = User.search(params[:search]).group_by{|i| i}.map{|k,v| [k, v.count] }
    end

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
