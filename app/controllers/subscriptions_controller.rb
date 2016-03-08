class SubscriptionsController < ApplicationController

  def create
    begin
      SubscriptionCreateService.new(email: params[:email]).call
      redirect_to :back
      flash[:success] = 'Вы успешно подписались на новости.'
    rescue Gibbon::MailChimpError
      SubscriptionRestoreService.new(email: params[:email]).call
      redirect_to :back
      flash[:success] = 'И снова добро пожаловать! Вы подписаны на новости.'
    end
  end

  def remove
    # subscriptions/remove?key=1asldkjlas
    if params[:key] && SubscriptionRemoveService.new(key: params[:key]).call
      redirect_to root_path
      flash[:success] = 'Вы успешно отписались от рассылки.'
    else
      redirect_to root_path
      flash[:danger] = 'Произошла ошибка. Возможно, вы не подписаны.'
    end
  end

end
