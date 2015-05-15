class ChangeColumnsProductsSalePriceAndOriginalPrice < ActiveRecord::Migration
  def change
    change_column :products, :sale_price, :decimal
    change_column :products, :original_price, :decimal
  end
end
