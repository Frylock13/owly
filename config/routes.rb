Rails.application.routes.draw do
  root 'pages#home'

  namespace :subscriptions do
    post :create
    get :remove
  end

  get 'cart' => 'carts#show'

  namespace :api, defaults: { format: :json } do
    scope :cart do
      put 'add', to: 'carts#add'
      put 'remove', to: 'carts#remove'
      get 'count', to: 'carts#count'
    end
  end
end
