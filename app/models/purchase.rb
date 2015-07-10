class Purchase < ActiveRecord::Base
  validates :buyer_id, :product_id, null: false

  belongs_to(
    :buyer,
    class_name: "User",
    foreign_key: :buyer_id,
    primary_key: :id,
  )

  belongs_to(
    :product,
    class_name: "Product",
    foreign_key: :product_id,
    primary_key: :id,
  )
end
