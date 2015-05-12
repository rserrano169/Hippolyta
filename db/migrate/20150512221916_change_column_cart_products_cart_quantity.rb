class ChangeColumnCartProductsCartQuantity < ActiveRecord::Migration
  def change
    rename_column :cart_products, :cart_quantity, :quantity 
  end
end
