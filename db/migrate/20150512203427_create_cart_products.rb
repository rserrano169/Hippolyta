class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :cart_id, null: false
      t.integer :product_id, null: false
      t.integer :cart_quantity, null: false, default: 0

      t.timestamps
    end
  end
end
