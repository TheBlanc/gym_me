class RemoveColumnsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :street_address, :string
    remove_column :users, :city, :string
    remove_column :users, :province, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :country, :string
  end
end
