class RemoveProductsCartIdColumn < ActiveRecord::Migration
  def change
    remove_column :products, :cart_id, :integer
  end
end
