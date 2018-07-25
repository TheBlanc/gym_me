class ChangeSexToBeStringInUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :sex, :string
  end

  def down
    change_column :users, :sex, :integer
  end
end
