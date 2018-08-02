class AddActivityGoalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activity_goal, :string
  end
end
