class ProductOrder < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :order_id, uniqueness: {scope: :product_id}
end
