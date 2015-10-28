class Order < ActiveRecord::Base
	before_save :default_role
  
  belongs_to :user

  has_many :product_orders
  has_many :products, through: :product_orders
  	enum role: [:pending, :paid, :canceled]

  	def default_role
  		self.role ||=0
  	end
end
