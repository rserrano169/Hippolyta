class ChangeProductsColumnsSalePriceAndOriginalPrice < ActiveRecord::Migration
  def change
    change_column :products, :sale_price, :decimal, precision: 12, scale: 2
    change_column :products, :original_price, :decimal, precision: 12, scale: 2
  end
end
