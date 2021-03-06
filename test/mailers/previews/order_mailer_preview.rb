class OrderMailerPreview < ActionMailer::Preview
  def new_order_email
    # Set up a temporary order for the preview
    order = Order.new
    OrderMailer.with(order: order).new_order_email
  end
end
