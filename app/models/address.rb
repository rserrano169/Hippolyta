class Address < ActiveRecord::Base
  validates :user_id, :name, :street, :city, :state, :zip, presence: true

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
  )
end
