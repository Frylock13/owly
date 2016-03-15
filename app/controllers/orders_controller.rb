class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    order = CreateOrder.new(order_params, session[:guest_id])
    redirect_to :back
    flash[:success] = 'Вы успешно оформили заказ'
  end

  def invoice
    @order = Order.find(params[:order_id]).decorate
    @products = GetProductsList.call(eval(@order.products))

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", encoding: 'UTF-8'
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :tel, :email, :city, :street, :building, :block, :apt, :floor,
                                  :comment, :company_name, :inn)
  end
end
