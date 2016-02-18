Rails.application.routes.draw do
  get 'carts/show'

  root 'pages#home'

  namespace :subscriptions do
    post :create
    get :remove
  end

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end
end
