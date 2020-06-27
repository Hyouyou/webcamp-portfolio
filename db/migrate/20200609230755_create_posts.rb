class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :explanation, null: false
      t.string :post_image_id
      t.integer :condition, null: false, default: 0
      t.boolean :is_burden, null: false, default: true

      t.timestamps
    end
  end
end
