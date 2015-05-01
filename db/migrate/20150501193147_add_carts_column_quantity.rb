class AddCartsColumnQuantity < ActiveRecord::Migration
  def change
    add_column :carts, :quantity, :integer, null: false, default: 0
  end
end
