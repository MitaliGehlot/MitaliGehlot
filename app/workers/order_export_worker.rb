class OrderExportWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    my_orders = user.orders
    xlsx_package = Axlsx::Package.new
    wb = xlsx_package.workbook
    wb.add_worksheet(name: "Payments") do |sheet|
      sheet.add_row ["ID" , "productname", "ProductModel","ProductPrice","Date"]
    
      my_orders.each do |order|
        sheet.add_row [order.id, order.product.name, order.product.model, order.product.price, order.date]
      end
    end
    xlsx_package.serialize("order_#{DateTime.now}.xlsx")
  end
end
