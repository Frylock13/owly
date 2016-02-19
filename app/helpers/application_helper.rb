module ApplicationHelper
  def cart_id
    "cart_#{session[:guest_id]}"
  end
end
