class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    order = CreateOrder.new(order_params, session[:guest_id])
    order.create
    redirect_to :back
    flash[:success] = 'Вы успешно оформили заказ'
  end

  private

  def order_params
    params.require(:order).permit(:name, :tel, :email, :city, :street, :building, :block, :apt, :floor,
                                  :comment, :company_name, :inn)
  end
end
