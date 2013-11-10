class AddFidelityCardToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :fidelity_card, :string
  end
end
