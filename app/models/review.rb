class Review < ActiveRecord::Base
	has_many :products, dependent: :destroy

	validates :content, presence: true
end
