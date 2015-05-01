class CreateTableCartsProdcts < ActiveRecord::Migration
  def change
    create_table :carts_products, id: false do |t|
      t.belongs_to :carts, index: true
      t.belongs_to :products, index: true

      t.timestamps
    end
  end
end
