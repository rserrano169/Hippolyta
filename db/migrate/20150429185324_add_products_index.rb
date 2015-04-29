class AddProductsIndex < ActiveRecord::Migration
  def change
    add_index :products, :seller_id
    add_index :products, :description
  end
end
