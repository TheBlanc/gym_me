class AddColumnToTableEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :activity_icon, :string
  end
end
