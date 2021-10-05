class OrdersController < ApplicationController
  
  def index
   @product =Product.find(params[:product_id])
   @order =  @product.orders.all

  end

  def show
    @product =Product.find(params[:product_id])
    @order = Order.find(params[:id])
  end

  def new
    @product =Product.find(params[:product_id])
    @order =  @product.orders.new
  end

  def show
    @product =Product.find(params[:product_id])
    @order =Order.find(params[:id])
  end

  def create
    @customer =Customer.find(params[:customer_id])
    @product =Product.find(params[:product_id])
    @order = @product.orders.new(order_params)
     if @order.save
      redirect_to product_order_path(@product)
    else
      render :new
    end
  end

  def edit
    @customer =Customer.find(params[:customer_id])
    @product =Product.find(params[:product_id])
    @order = Order.find(params[:id])
  end

  def update
    @product =Product.find(params[:product_id])
    @order =Order.find(params[:id])
        if @order.update(order_params)
      redirect_to product_order_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product =Product.find(params[:product_id])
    @order = @product.orders.find(params[:id])

    @order.destroy
    redirect_to root_path(@product)
  end

  private 
    def order_params
    params.require(:order).permit(:address, :phon_no)
end
end
