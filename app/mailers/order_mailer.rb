class OrderMailer < ApplicationMailer

  def order_created(order)
    @order_id = order.id
    @invoice_url  = "http://37.143.11.71/orders/#{order.id}/invoice.pdf?key=#{order.invoice_key}" if order.invoice_key
    mail(to: order.email, subject: 'Заказ успешно оформлен')
  end
end
