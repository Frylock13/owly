class SubscriptionsController < ApplicationController

  def create
    begin
      SubscriptionCreateService.new(params[:email]).call
    # if email in unsuscribe list - restore it  
    rescue Gibbon::MailChimpError
      SubscriptionRestoreService.new(params[:email]).call
    end

    redirect_to :back
    flash[:success] = 'Вы успешно подписались на новости.'
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
