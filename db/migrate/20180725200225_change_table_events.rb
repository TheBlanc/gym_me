class ChangeTableEvents < ActiveRecord::Migration[5.2]
  def change
     rename_column :events, :location, :address
     add_column :events, :name, :string
     add_column :events, :latitude, :float
     add_column :events, :logitude, :float
  end
end
