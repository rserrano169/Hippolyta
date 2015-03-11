class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :seller_id, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end

    add_index :products, :name
    add_index :products, :seller_id
  end
end
