class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :news, limit: 150

      t.timestamps
    end
  end
end
