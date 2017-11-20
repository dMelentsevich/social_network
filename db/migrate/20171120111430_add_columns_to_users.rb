class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :surname, :string, default: "", null: false
  	add_column :users, :sex, :integer
  	add_column :users, :date_of_birth, :date
  	add_column :users, :city, :string
  	add_column :users, :phone_number, :string
  end
end
