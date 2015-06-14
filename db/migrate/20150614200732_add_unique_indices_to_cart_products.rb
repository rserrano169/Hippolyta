class AddUniqueIndicesToCartProducts < ActiveRecord::Migration
  def change
    add_index :cart_products, [:cart_id, :product_id], unique: true
    add_index :cart_products, [:product_id, :cart_id], unique: true
  end
end
