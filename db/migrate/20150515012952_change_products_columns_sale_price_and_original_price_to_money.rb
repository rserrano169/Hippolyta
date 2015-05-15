class ChangeProductsColumnsSalePriceAndOriginalPriceToMoney < ActiveRecord::Migration
  def change
    change_column :products, :sale_price, :money
    change_column :products, :original_price, :money
  end
end
