class Product < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
                  against: { name: 'A', description: 'B' },
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
    dependent: :destroy
  )
end
