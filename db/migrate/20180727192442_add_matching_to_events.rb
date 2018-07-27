class AddMatchingToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :matching, :boolean
  end
end
