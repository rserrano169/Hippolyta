class AddUsersColumnDefaultShippingAddressId < ActiveRecord::Migration
  def change
    add_column :users, :default_shipping_address_id, :integer

    add_index :users, :default_shipping_address_id
  end
end
