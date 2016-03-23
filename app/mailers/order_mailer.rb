class OrderMailer < ApplicationMailer

  include Sidekiq::Mailer

  def order_created_to_user(order_id)
    @order = Order.find(order_id)
    @order_id = order_id
    @invoice_url  = "http://37.143.11.71/orders/#{@order_id}/invoice.pdf?key=#{@order.invoice_key}" if @order.invoice_key

    mail(to: @order.email, subject: 'Заказ успешно оформлен')
  end

  def order_created_to_admin(order_id)
    @order_id = order_id
    @order_url  = "http://37.143.11.71/admin/orders/#{@order_id}"

    mail(to: Setting.admin_email, subject: 'Новый заказ')
  end
end
