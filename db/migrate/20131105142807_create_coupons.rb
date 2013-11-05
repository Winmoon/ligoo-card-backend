class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :user, index: true
      t.references :promotion, index: true

      t.timestamps
    end
  end
end
