class AddUsersColumnStripeDefaultCardId < ActiveRecord::Migration
  def change
    add_column :users, :stripe_default_card_id, :string

    add_index :users, :stripe_default_card_id, unique: true
  end
end
