class ChangeReviewsColumnText < ActiveRecord::Migration
  def change
    change_column :reviews, :text, :text, limit: 5000
  end
end
