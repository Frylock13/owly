class SubscriptionsController < ApplicationController
  def add
    if AddNewSubscription.call(params[:email])
      redirect_to :back
      flash[:success] = 'Вы подписались на новости.'
    else
      redirect_to :back
      flash[:danger] = 'Произошла ошибка. Возможно, вы уже подписаны.'
    end
  end

  def remove
    # subscriptions/remove?key=1asldkjlas
    if params[:key] && RemoveSubscription.call(params[:key])
      redirect_to root_path
      flash[:success] = 'Вы успешно отписались от рассылки.'
    else
      redirect_to root_path
      flash[:danger] = 'Произошла ошибка. Возможно, вы не подписаны.'
    end
  end
end
