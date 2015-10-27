class ReviewsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show] 
  	before_action :check_cliente!, only: [:edit, :update] 
  	before_action :check_admin!, only: [:destroy]

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
