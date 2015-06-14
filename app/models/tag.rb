class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :name, length: {maximum: 20}

  has_many(
    :product_tags,
    class_name: "ProductTag",
    foreign_key: :tag_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :products, through: :product_tags, source: :product
end
