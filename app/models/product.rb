class Product < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
                  against: { name: 'A', description: 'B' },
                  associated_against: {
                    tags: { name: 'C' }
                  },
                  ignoring: :accents,
                  using: {
                    tsearch: {
                      dictionary: "english",
                      anyword: true,
                      prefix: true
                    },
                    trigram: {},
                    dmetaphone: { anyword: true }
                  }

  validates :name, :seller_id, :sale_price, :quantity, presence: true

  has_attached_file :picture,
                    styles: {
                      thumb: "65x65",
                      small: "100x100",
                      medium: "200x200",
                      large: "300x300"
                    },
                    default_url: "product_default_picture_medium.gif"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  belongs_to(
    :seller,
    class_name: "User",
    foreign_key: :seller_id,
    primary_key: :id,
  )

  has_many(
    :cart_products,
    class_name: "CartProduct",
    foreign_key: :product_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :carts, through: :cart_products, source: :cart

  has_many(
    :purchased_products,
    class_name: "PurchasedProduct",
    foreign_key: :product_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :product_tags,
    class_name: "ProductTag",
    foreign_key: :product_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :tags, through: :product_tags, source: :tag

  has_many(
    :reviews,
    class_name: "Review",
    foreign_key: :product_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :reviewers, through: :reviews, source: :reviewer

  def buyers
    buyers = []

    if self.carts.any?
      self.carts.each do |cart|
        if !cart.buyer_id
          buyers << "guest"
        else
          buyers << User.find(cart.buyer_id)
        end
      end
    end

    buyers
  end

end
