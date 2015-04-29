class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :buyer_id
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :carts, :buyer_id, unique: true
    add_index :carts, :session_token, unique: true
  end
end
