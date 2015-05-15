class RemoveMoneyFromProductsColumns < ActiveRecord::Migration
  def change
    remove_money :products, :sale_price
    remove_money :products, :original_price
  end
end
