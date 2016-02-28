class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to :back
      flash[:success] = 'Вы успешно оформили заказ'
    else
      redirect_to :back
      flash[:danger] = 'Произошла ошибка'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :tel, :email, :city, :street, :building, :block, :apt, :floor,
                                  :comment, :company_name, :inn)
  end
end
