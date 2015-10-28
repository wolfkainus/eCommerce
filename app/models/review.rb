class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user
	has_many :products, dependent: :destroy

  	has_many :likes, as: :likeable
  	has_many :user_likes, through: :likes, source: :user

	validates :content, presence: true

	def create
		product = Product.find(params[:product_id])

		@review = product.reviews.build(review_params)
		@review.save
		redirect_to product
	end

	def like
		@like = @product.likes.build(user: current_user) if user_signed_in?
		@like.save

		redirect_to @product, notice: 'Gracias por tu like'
	end

	private
		def review_params
			params.require(:review).permit(:content)
		end
end
