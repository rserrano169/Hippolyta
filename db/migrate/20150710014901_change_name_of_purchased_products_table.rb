class ChangeNameOfPurchasedProductsTable < ActiveRecord::Migration
  def change
    rename_table :purchased_products, :purchases
  end
end
