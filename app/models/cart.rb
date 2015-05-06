class Cart < ActiveRecord::Base
  validates :session_token, presence: true, uniqueness: true

  belongs_to(
    :buyer,
    class_name: "User",
    foreign_key: :buyer_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_and_belongs_to_many :products

  def quantity
    self.products.length
  end

  def total
    @total_price = 0
    self.products.each do |product|
      @total_price += product.sale_price
    end

    return @total_price
  end
end
