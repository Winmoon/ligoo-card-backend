class ChangeDescriptionLengthFromEstablishment < ActiveRecord::Migration
  def change
    change_column :establishments, :description, :string, limit: 420
  end
end
