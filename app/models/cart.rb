class Cart < ActiveRecord::Base
  validates :session_token, presence: true, uniqueness: true

  belongs_to(
    :buyer,
    class_name: "User",
    foreign_key: :buyer_id,
    primary_key: :id,
  )

  has_many(
    :cart_products,
    class_name: "CartProduct",
    foreign_key: :cart_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :products, through: :cart_products, source: :product

  def quantity
    self.products.length
  end

  def total
    @total_price = 0
    self.cart_products.each do |cart_prod|
      @total_price += cart_prod.product.sale_price * cart_prod.quantity
    end

    return @total_price
  end
end
