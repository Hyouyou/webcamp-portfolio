class AddColumnBodyAndStatusToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :is_status, :boolean, default: true
  	add_column :posts, :cycle, :integer, default: 0
  end
end
