class AddSharePointsToEstablishment < ActiveRecord::Migration
  def up
    add_column :establishments, :share_points, :integer, default: 0
  end
  def down
    remove_column :establishments, :share_points
  end
end
