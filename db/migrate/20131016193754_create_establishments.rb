class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
