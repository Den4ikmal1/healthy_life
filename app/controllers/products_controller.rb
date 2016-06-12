class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :destroy, :edit, :update]

  def new 
    @product = Product.new
  end 

  def show
  end

  def etit
    
  end

  def update
    @product.update(product_params)
    redirect_to @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :emulcifying_value, :protein, :carbohydrates, :fats, :portion, ration_ids: [], attachments_attributes: [:file])
    end


    def find_product
      @product = Product.find(params[:id])
    end
end
