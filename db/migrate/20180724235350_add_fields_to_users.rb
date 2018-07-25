class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :sex, :integer
    add_column :users, :location, :string
    add_column :users, :fitness_level, :integer
    add_column :users, :description, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
