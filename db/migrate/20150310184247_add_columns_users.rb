class AddColumnsUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    change_column :users, :name, :string, null: false
  end
end
