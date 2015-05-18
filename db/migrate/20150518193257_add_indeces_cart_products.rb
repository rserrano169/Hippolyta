class AddIndecesCartProducts < ActiveRecord::Migration
  def change
    add_index :cart_products, :cart_id
    add_index :cart_products, :product_id
  end
end
