class OrdersController < ApplicationController
  #include will_paginate
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
      OrderMailer.new_order_email(@order, current_user).deliver_later
      flash[:success] = "Thank you for your order! We'll get contact you soon!"
     redirect_to product_order_path(@product , @order)
    else
     flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
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
    @my_orders = current_user.orders.paginate(page: params[:page],  per_page: 5)
  end  
  
  def export
    OrderExportWorker.perform_async(current_user.id)
  end 
   
  private 
    def order_params
    params.require(:order).permit(:address, :phone_no, :amount, :payment_type)
  end
  end
