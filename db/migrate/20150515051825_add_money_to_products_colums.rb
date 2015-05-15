class AddMoneyToProductsColums < ActiveRecord::Migration
  def change
    add_money :products, :sale_price
    add_money :products, :original_price
  end
end
