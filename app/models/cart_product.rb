class CartProduct < ActiveRecord::Base
  validates :cart_id, :product_id, :quantity, null: false

  belongs_to(
    :cart,
    class_name: "Cart",
    foreign_key: :cart_id,
    primary_key: :id,
  )

  belongs_to(
    :product,
    class_name: "Product",
    foreign_key: :product_id,
    primary_key: :id,
  )
end
