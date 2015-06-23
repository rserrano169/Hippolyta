class AddUsersColumnCurrentShippingAddressId < ActiveRecord::Migration
  def change
    add_column :users, :current_shipping_address_id, :integer

    add_index :users, :current_shipping_address_id
  end
end
