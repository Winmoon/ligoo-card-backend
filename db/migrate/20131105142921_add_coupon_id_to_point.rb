class AddCouponIdToPoint < ActiveRecord::Migration
  def change
    add_column :points, :coupon_id, :integer
    add_index :points, :coupon_id
  end
end
