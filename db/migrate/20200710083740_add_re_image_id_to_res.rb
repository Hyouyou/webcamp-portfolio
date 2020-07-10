class AddReImageIdToRes < ActiveRecord::Migration[5.2]
  def change
    add_column :res, :re_image_id, :string
  end
end
