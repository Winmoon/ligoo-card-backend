class CreateCards < ActiveRecord::Migration
  def up
    create_table :cards do |t|
      t.references :user, index: true
      t.references :establishment, index: true

      t.timestamps
    end

    User.find_each do |user|
      user.establishments.each do |establishment|
        user.card(establishment.id)
      end
    end
  end

  def down
    drop_table :cards
  end
end
