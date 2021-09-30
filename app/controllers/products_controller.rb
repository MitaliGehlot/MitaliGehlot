class ProductsController < ApplicationController
  def index
    @category =Category.find(params[:id])
    @products = @category.products.all
  end

  def new
    @category =Category.find(params[:category_id])
    @product =  @category.products.new
  end
  
  def show
    @category =Category.find(params[:category_id])

    @product =Product.find(params[:id])
  end

  def create
    @category =Category.find(params[:category_id])
    @product =  @category.products.new(product_params)
     if @product.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
   @category =Category.find(params[:category_id])
   @product = Product.find(params[:id])
 end

  def update
    @category =Category.find(params[:category_id])
    @product = Product.find(params[:id])
     if @product.update(product_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path(@category)
  end

  private 
    def product_params
    params.require(:product).permit(:name,:price, :model)
end
end
