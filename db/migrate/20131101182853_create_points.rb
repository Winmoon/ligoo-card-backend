class CreatePoints < ActiveRecord::Migration
  def up
    create_table :points do |t|
      t.references :user, index: true
      t.references :establishment, index: true
      t.string :point_type

      t.timestamps
    end
  end
  def down
    drop_table :points
  end
end
