class RenameValueColumnToRes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :res, :value, :cycle
  end
end
