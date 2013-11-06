class AddBirthDateAndGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :birth_date, :date
    add_column :users, :gender, :string
  end
end
