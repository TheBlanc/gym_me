class AddDateColumnsToEvents < ActiveRecord::Migration[5.2]
  def up
      add_column :events, :end_date, :date
      add_column :events, :persistence, :boolean
  end
  def down
    add_column :events, :end_date
    add_columns :events, :persistence
  end
end
