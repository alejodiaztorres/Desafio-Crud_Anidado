class ProductsController < ApplicationController

    def create
        @category = Category.find(params[:category_id])
        @product = Product.new(product_params)
        @product.category = @category
        @product.save 
        redirect_to category_path
    end

    def show
        @product = Product.find(params[:id])
      end
      
      def destroy
         @product = Product.find(params[:id])
         @product.destroy
         redirect_to category_path
      end

    private
    def product_params
        params.require(:product).permit(:name, :price, :category_id)
    end
    
end
