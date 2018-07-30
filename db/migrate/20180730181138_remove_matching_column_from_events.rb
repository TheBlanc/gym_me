class RemoveMatchingColumnFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :matching, :boolean
  end
end
