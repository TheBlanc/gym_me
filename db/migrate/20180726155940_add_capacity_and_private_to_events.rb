class AddCapacityAndPrivateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :capacity, :integer
    add_column :events, :need_approval, :boolean
  end
end
