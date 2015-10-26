class Review < ActiveRecord::Base
	belongs_to :product
	has_many :products, dependent: :destroy

	validates :content, presence: true

	def create
		product = Product.find(params[:product_id])

		@review = product.reviews.build(review_params)
		@review.save
		redirect_to product
	end

	private
		def review_params
			params.require(:review).permit(:content)
		end
end