class DropTableCartsProducts < ActiveRecord::Migration
  def change
    drop_table :carts_products
  end
end
