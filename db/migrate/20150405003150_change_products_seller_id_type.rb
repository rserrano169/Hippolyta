class ChangeProductsSellerIdType < ActiveRecord::Migration
  def change
    remove_column :products, :seller_id
    add_column :products, :seller_id, :integer
    change_column :products, :seller_id, :integer, null: false
  end
end
