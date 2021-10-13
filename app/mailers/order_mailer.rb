class OrderMailer < ApplicationMailer


 def new_order_email(order, user)
   @user = user
   @order = order
   mail(to: user.email, subject: 'Order Succesfully submitted')
 end
end


