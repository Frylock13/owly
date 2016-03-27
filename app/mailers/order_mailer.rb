class OrderMailer < ApplicationMailer

  def order_created_to_user(order_id)
    @order = Order.find(order_id)
    @order_id = order_id
    @invoice_url  = "http://owly.ru/orders/#{@order_id}/invoice.pdf?key=#{@order.invoice_key}" if @order.invoice_key

    mail(to: @order.email, subject: 'Заказ успешно оформлен')
  end

  def order_created_to_admin(order_id)
    @order_id = order_id
    @order_url  = "http://owly.ru/admin/orders/#{@order_id}"

    mail(to: Setting.admin_email, subject: 'Новый заказ')
  end
end
