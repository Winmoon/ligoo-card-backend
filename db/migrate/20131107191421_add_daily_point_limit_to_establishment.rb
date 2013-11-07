class AddDailyPointLimitToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :daily_point_limit, :boolean, default: true
  end
end
