class AddSharePointsToPromotion < ActiveRecord::Migration
  def up
    add_column :promotions, :share_points, :integer
  end
  def down
    remove_column :promotions, :share_points
  end
end
