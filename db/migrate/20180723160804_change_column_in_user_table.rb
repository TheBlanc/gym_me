class ChangeColumnInUserTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passwod_digest, :password_digest
  end
end
