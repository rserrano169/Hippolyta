class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text  :text, limit: 2550, null: false
      t.integer :rating, null: false
      t.integer :reviewer_id, null: false
      t.integer :product_id, null: false

      t.timestamps
    end
    add_index :reviews, :reviewer_id
    add_index :reviews, :product_id
  end
end
