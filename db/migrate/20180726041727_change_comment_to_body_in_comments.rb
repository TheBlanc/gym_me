class ChangeCommentToBodyInComments < ActiveRecord::Migration[5.2]
  def up
    remove_column :comments, :comment, :text
    add_column :comments, :body, :text
  end

  def down
    add_column :comments, :comment, :text
    remove_column :comments, :body, :text
  end
end
