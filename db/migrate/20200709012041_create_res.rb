class CreateRes < ActiveRecord::Migration[5.2]
  def change
    create_table :res do |t|

      t.integer :user_id, null:false
      t.string :title, null:false
      t.string :value, null: false, default: 0
      t.text :content, null:false

      t.timestamps
    end
  end
end
