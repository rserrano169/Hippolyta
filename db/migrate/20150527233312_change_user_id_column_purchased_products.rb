class ChangeUserIdColumnPurchasedProducts < ActiveRecord::Migration
  def change
    rename_column :purchased_products, :user_id, :buyer_id
  end
end
