class MakeProductsNameUnique < ActiveRecord::Migration
  def change
    remove_index :products, :name
    add_index :products, :name, unique: true
  end
end
