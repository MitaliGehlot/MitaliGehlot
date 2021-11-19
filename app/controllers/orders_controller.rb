class OrdersController < ApplicationController
  #include will_paginate
  before_action :set_product, only: [:index, :new, :show, :edit, :update, :destroy]

  def index
   @order =  @product.orders.all
  end

  def new
   @order =  @product.orders.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @product =Product.find(params[:product_id])
    @order = @product.orders.new(order_params)
    @order.user=current_user
    @order.date=DateTime.now
     if @order.save!
    OrderMailer.new_order_email(current_user.id, @order.id).deliver
      flash[:success] = "Thank you for your order!"
     redirect_to product_order_path(@product , @order)
    else
     flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
     render :new
   end
  end 

  def edit
   @order = Order.find(params[:id])
  end 

  def update
    @order =Order.find(params[:id])
        if @order.update(order_params)
      redirect_to product_order_path(@product , @order)
    else

      render :edit
    end
  end

  def destroy
    @order =Order.find(params[:id])
    @order.destroy
   redirect_to root_path ( @order)
  end

  def my_orders
    @my_orders = current_user.orders.paginate(page: params[:page],  per_page: 5)
  end  
  
  def user_orders
    @order = Order.all
    @order = @order.paginate(page: params[:page],  per_page: 5)
  end 
   
  def export
    OrderExportWorker.perform_async(current_user.id)
  end 


   
  private 

  def order_params
    params.require(:order).permit(:address, :phone_no, :amount, :payment_type)
  end

  def set_product
    @product =Product.find(params[:product_id])
  end 

  end
