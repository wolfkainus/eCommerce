class Category < ActiveRecord::Base
	has_many :products
	belongs_to :category

	def to_s
		self.name
	end
end

