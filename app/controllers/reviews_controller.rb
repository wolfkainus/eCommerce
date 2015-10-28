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

	def like
		@product = Product.find(params[:product_id])
		@review = Review.find(params[:id])
		@like = @review.likes.build(user: current_user)

		if @review.liked_by? current_user
			@review.remove_like current_user
			redirect_to @product, notice: 'Ok, ya no te gusta'
		elsif @review.save
			redirect_to @product, notice: 'Nos gusta que le guste'
		else
			redirect_to @product, notice: 'Ha ocurrido un error, tu like no fue guardado'
		end
 	end


	private
		def review_params
			params.require(:review).permit(:content)
		end

end
