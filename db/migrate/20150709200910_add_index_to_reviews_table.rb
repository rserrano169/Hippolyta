class AddIndexToReviewsTable < ActiveRecord::Migration
  def change
    add_index :reviews, [:reviewer_id, :product_id], unique: true
  end
end
