class RemoveColumnsFromUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :avatar
  	remove_column :users, :cover
  	remove_column :users, :about
  	remove_column :users, :image
  end
end
