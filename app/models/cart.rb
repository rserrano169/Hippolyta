class Cart < ActiveRecord::Base
  validates :buyer_id, :session_token, uniqueness: true
  validates :session_token, presence: true

  belongs_to(
    :buyer,
    class_name: "User",
    foreign_key: :buyer_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_and_belongs_to_many :products
end
