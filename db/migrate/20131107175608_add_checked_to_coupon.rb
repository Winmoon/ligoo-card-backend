class AddCheckedToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :checked, :boolean
  end
end
