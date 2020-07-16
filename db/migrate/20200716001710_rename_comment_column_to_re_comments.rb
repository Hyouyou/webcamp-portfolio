class RenameCommentColumnToReComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :re_comments, :comment, :body
  end
end
