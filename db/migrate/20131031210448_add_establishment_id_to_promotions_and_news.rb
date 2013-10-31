class AddEstablishmentIdToPromotionsAndNews < ActiveRecord::Migration
  def change
    add_column :promotions, :establishment_id, :integer
    add_column :news, :establishment_id, :integer
    add_index :news, :establishment_id
    add_index :promotions, :establishment_id
  end
end
