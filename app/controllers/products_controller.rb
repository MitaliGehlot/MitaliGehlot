class ProductsController < ApplicationController
  before_action :set_category
  before_action :set_product, only: [:show, :edit, :update, :destroy, :download_pdf]

  def index
    @products = @category.products.all
  end

  def new
    @product =  @category.products.new
  end

  def create
    @product =  @category.products.new(product_params)
     if @product.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to category_path(@category, @product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to category_path(@category)
  end 

  def search
    @products = Product.search(params[:search], params[:category_id])
  end 
  
  def download_pdf
    respond_to do |format|
     format.html
     format.pdf do
      render template: "products/order_pdf.html.erb",
         pdf: "product: #{@product.name}"
      end
    end
  end


    private 

    def product_params
      params.require(:product).permit(:name, :price, :model , :file, :search)
    end

    def set_category
      @category = Category.find_by(id: params[:category_id])
    end

    def set_product
      @product =Product.find(params[:id])
    end
  end
 