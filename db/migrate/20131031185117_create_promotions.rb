class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :description
      t.integer :points
      t.datetime :valid_until

      t.timestamps
    end
  end
end
