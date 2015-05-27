class CreatePurchasedProducts < ActiveRecord::Migration
  def change
    create_table :purchased_products do |t|
      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
