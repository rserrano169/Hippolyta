class ChangeAndAddColumnProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :float
    rename_column :products, :price, :sale_price
    add_column :products, :original_price, :float
  end
end
