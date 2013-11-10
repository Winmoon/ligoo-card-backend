class AddPlanToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :plan, :string, default: 'default'
  end
end
