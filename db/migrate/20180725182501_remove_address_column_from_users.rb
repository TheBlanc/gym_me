class RemoveAddressColumnFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :address
  end

  def down
    add_column :users, :address, :hstore
  end
end
