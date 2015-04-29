class AddProductsColumnCartId < ActiveRecord::Migration
  def change
    add_column :products, :cart_id, :integer
    add_index :products, :cart_id
  end
end
