class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :establishment, index: true

      t.timestamps
    end
  end
end
