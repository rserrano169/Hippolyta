class Product < ActiveRecord::Base
  validates :name, :seller_id, :sale_price, :quantity, presence: true

  belongs_to(
    :seller,
    class_name: "User",
    foreign_key: :seller_id,
    primary_key: :id,
    dependent: :destroy
  )
end
