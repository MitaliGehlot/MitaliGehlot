class OrderMailer < ApplicationMailer


  def new_order_email(user_id, order_id)
    @user = User.find(user_id)
    @admin_user = User.where(role: 'admin').first
    @order = Order.find(order_id)
    mail(to: @admin_user.email, subject: "A new order is placed by #{@user.email} with order id: #{@order.id}")  
  end
end


