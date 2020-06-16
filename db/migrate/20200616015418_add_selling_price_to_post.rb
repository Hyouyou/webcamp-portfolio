class AddSellingPriceToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :selling_price, :integer
  end
end
