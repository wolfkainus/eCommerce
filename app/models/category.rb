class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy

	validates :name, precense:true
end
