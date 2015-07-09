class Review < ActiveRecord::Base
  validates :text, :rating, :reviewer_id, :product_id, presence: true
  validates_inclusion_of :rating, in: 0..5
  validates_length_of :text, in: 1..5000

  belongs_to(
    :reviewer,
    class_name: "User",
    foreign_key: :reviewer_id,
    primary_key: :id
  )

  belongs_to(
    :product,
    class_name: "Product",
    foreign_key: :product_id,
    primary_key: :id
  )
end
