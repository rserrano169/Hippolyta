class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :name, length: {maximum: 20}

  
end
