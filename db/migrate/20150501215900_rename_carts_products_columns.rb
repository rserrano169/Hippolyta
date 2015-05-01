class RenameCartsProductsColumns < ActiveRecord::Migration
  def change
    rename_column :carts_products, :products_id, :product_id
    rename_column :carts_products, :carts_id, :cart_id
  end
end
