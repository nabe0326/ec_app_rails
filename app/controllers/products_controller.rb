class ProductsController < ApplicationController
    before_action :correct_user, only: %i[new,show] 
    def index
        @products = Product.all
    end
    def new
        @product = Product.new
    end
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path, notice: 'Product was successfully created'
        else
            render :new
        end
    end

    def show
        @product = Product.find(params[:id])
    end
    def edit
        @product = Product.find(params[:id])
    end
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
          redirect_to product_path(@product), notice: "商品情報を更新しました。"
        else
          render :edit
        end
      end
    private
    def product_params
        params.require(:product).permit(:name, :description, :price , :image)
    end
    def correct_user
        if current_user.admin == false
            redirect_back(fallback_location: root_path)
        end
    end
end
