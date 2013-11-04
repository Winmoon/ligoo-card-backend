class ChangeLlFieldTypesFromEstablishment < ActiveRecord::Migration
  def change
    change_column :establishments, :latitude, :decimal, :precision => 25, :scale => 10
    change_column :establishments, :longitude, :decimal, :precision => 25, :scale => 10
  end
end
