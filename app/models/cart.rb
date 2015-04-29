class Cart < ActiveRecord::Base
  validates :buyer_id, :session_token, uniqueness: true
  validates :session_token, presence: true

  belongs_to(
    :buyer,
    classname: "User",
    foreign_key: :buyer_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :items,
    classname: "Product",
    foreign_key: :cart_id,
    primary_key: :id
  )
end
