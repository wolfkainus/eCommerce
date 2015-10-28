class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = @product.reviews.reverse
  end

  def like
      @product = Product.find(params[:id])
      @like = @product.likes.build(user: current_user)

      if @product.liked_by? current_user
        @product.remove_like current_user
        redirect_to @product, notice: 'Ok, ya no te gusta'
      elsif @product.save
        redirect_to @product, notice: 'Nos gusta que le guste'
      else
        redirect_to @product, notice: 'Intentalo de nuevo, tu like no quedo registrado'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id, :image)
    end
end
