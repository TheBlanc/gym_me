class AddClomnToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :postal_code, :string
    add_column :users, :address, :string

  end
  def down
      remove_column :users, :first_name, :string
      remove_column :users, :last_name, :string
      remove_column :users, :phone_number, :integer
      remove_column :users, :postal_code, :string
      remove_column :users, :address, :string 
  end
end
