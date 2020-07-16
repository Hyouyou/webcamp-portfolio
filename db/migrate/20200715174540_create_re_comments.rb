class CreateReComments < ActiveRecord::Migration[5.2]
  def change
    create_table :re_comments do |t|
      t.integer :user_id, null: false
      t.integer :re_id, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
