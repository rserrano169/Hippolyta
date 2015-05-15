class ChangeProductsColumnsSalePriceAndOriginalPrice < ActiveRecord::Migration
  def change
    change_column :products, :sale_price, :integer
    change_column :products, :original_price, :integer
  end
end
