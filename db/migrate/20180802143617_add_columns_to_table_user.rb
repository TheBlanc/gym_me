class AddColumnsToTableUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :day, :string
    add_column :users, :time_of_day, :string
  end
end
