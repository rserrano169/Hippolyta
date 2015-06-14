class ProductTag < ActiveRecord::Base
  validates :tag_id, :product_id, presence: true

  belongs_to(
    :product,
    class_name: "Product",
    foreign_key: :product_id,
    primary_key: :id
  )

  belongs_to(
    :tag,
    class_name: "Tag",
    foreign_key: :tag_id,
    primary_key: :id
  )
end
