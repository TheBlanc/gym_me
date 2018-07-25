class AddAddressColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :street_address, :string
    add_column :events, :city, :string
    add_column :events, :province, :string
    add_column :events, :country, :string
  end
end
