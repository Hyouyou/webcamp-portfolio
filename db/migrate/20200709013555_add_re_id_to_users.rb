class AddReIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :re_id, :integer
    add_column :likes, :re_id, :integer
  end
end
