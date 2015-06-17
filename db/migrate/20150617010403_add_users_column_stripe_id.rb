class AddUsersColumnStripeId < ActiveRecord::Migration
  def change
    add_column :users, :stripe_id, :string

    add_index :users, :stripe_id, unique: true
  end
end
