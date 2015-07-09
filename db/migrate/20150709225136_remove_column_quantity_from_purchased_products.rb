class RemoveColumnQuantityFromPurchasedProducts < ActiveRecord::Migration
  def change
    remove_column :purchased_products, :quantity
  end
end
