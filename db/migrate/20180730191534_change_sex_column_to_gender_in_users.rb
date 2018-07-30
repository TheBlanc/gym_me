class ChangeSexColumnToGenderInUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :gender, :string
    remove_column :users, :sex, :string
  end

  def down
    add_column :users, :sex, :string
    remove_column :users, :gender, :string    
  end
end
