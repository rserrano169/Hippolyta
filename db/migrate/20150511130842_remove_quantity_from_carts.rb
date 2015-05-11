class RemoveQuantityFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :quantity, :integer
  end
end
