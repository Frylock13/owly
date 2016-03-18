class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    OrderCreateService.new(order_params, session[:guest_id]).call
    redirect_to :back
    flash[:success] = 'Вы успешно оформили заказ'
  end

  def invoice
    @order = Order.find(params[:order_id]).decorate
    @products = GetProductsList.call(eval(@order.products))
    @monthly_orders_count = Order.only_legal_entity.count + 1

    not_found unless params[:key] && @order.invoice_key == params[:key]

    respond_to do |format|
      format.pdf do
        render pdf: "", encoding: 'UTF-8'
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :tel, :email, :city, :street, :building, :block, :apt, :floor,
                                  :comment, :company_name, :inn)
  end
end
