class AddMatchingColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :matching, :boolean
  end
end
