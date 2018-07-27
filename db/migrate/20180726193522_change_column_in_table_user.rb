class ChangeColumnInTableUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :chat_rooms_id, :chat_room_id
  end
end
