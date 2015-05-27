class AddIndecesPurchasedProducts < ActiveRecord::Migration
  def change
    add_index :purchased_products, :user_id
    add_index :purchased_products, :product_id
  end
end
