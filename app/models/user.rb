class User < ActiveRecord::Base
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }

  has_attached_file :picture,
                    styles: {
                      thumb: "65x65",
                      small: "100x100",
                      medium: "200x200",
                      large: "300x300"
                    },
                    default_url: "user_default_picture_:style.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  attr_reader :password

  after_initialize :ensure_session_token!

  has_many(
    :products,
    class_name: "Product",
    foreign_key: :seller_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :queries,
    class_name: "Query",
    foreign_key: :querier_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_one(
    :cart,
    class_name: "Cart",
    foreign_key: :buyer_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :cart_products, through: :cart, source: :cart_products

  has_many(
    :addresses,
    class_name: "Address",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :purchased_products,
    class_name: "PurchasedProduct",
    foreign_key: :buyer_id,
    primary_key: :id,
    dependent: :destroy
  )

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil? || !user.valid_password?(password)

    return user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def default_shipping_address
    return nil unless self.default_shipping_address_id

    Address.find(self.default_shipping_address_id)
  end

  def current_shipping_address
    return nil unless self.current_shipping_address_id

    Address.find(self.current_shipping_address_id)
  end
end
