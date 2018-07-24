class ChangeColumnNameInEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :creator, :user_id
  end
end
