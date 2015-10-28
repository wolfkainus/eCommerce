class Cart < ActiveRecord::Base
  has_many :product
  belongs_to :user

  validates :user_id, uniqueness: { scope: :product_id }
  validates :quantity, presence: true
end
