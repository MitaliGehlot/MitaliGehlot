class OrdersController < ApplicationController
  
  def index
   @product =Product.find(params[:product_id])
   @order =  @product.orders.all
  end

  def new
   @product = Product.find(params[:product_id])
   @order =  @product.orders.new
  end

  def show
    @product =Product.find(params[:product_id])
    @order = Order.find(params[:id])

  end

  def create
    @product =Product.find(params[:product_id])
    @order = @product.orders.new(order_params)
    @order.user=current_user
    @order.date=DateTime.now
     if @order.save!
      redirect_to product_order_path(@product , @order)
    else
      render :new
    end
  end

  def edit
    @product =Product.find(params[:product_id])
    @order = Order.find(params[:id])
  end

  def update
    @product =Product.find(params[:product_id])
    @order =Order.find(params[:id])
        if @order.update(order_params)
      redirect_to product_order_path(@product , @order)
    else
      render :edit
    end
  end

  def destroy
    @product =Product.find(params[:product_id])

    @order.destroy
   redirect_to root_path(@product , @order)
  end

  def my_orders
    @my_orders = current_user.orders
  end  

  private 
    def order_params
    params.require(:order).permit(:address, :phone_no, :amount, :payment_type)
end
end
