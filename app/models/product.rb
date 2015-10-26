class Product < ActiveRecord::Base
	belongs_to :reviews
	has_many :reviews, dependent: :destroy

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :stock, presence: true
end
