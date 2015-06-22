class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :apt
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
