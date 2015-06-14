class RemoveIndicesFromCartProducts < ActiveRecord::Migration
  def change
    remove_index :cart_products, :cart_id
    remove_index :cart_products, :product_id
  end
end
