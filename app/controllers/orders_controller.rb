class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:name, :tel, :email, :city, :street, :building, :block, :apt, :floor,
                                  :comment, :company_name, :inn)
  end
end
