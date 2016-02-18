class SubscribesController < ApplicationController
  def add
    if AddNewSubscription.new(params[:email]).call
      redirect_to :back
      flash[:success] = 'Вы подписались на новости.'
    else
      redirect_to :back
      flash[:danger] = 'Произошла ошибка. Попробуйте еще раз.'
    end
  end

  def remove
  end
end
