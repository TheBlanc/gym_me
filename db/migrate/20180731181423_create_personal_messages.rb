class CreatePersonalMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_messages do |t|
      t.string :body
      t.integer :conversation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
