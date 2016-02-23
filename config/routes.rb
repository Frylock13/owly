Rails.application.routes.draw do
  get 'products/show'

  root 'pages#home'

  namespace :subscriptions do
    post :create
    get :remove
  end

  get 'cart' => 'carts#show'
  get 'categories/:slug' => 'categories#show', as: 'category'
  get 'products/:id' => 'products#show', as: 'product'

  namespace :api, defaults: { format: :json } do
    scope :cart do
      put 'add', to: 'carts#add'
      put 'remove', to: 'carts#remove'
      get 'count', to: 'carts#count'
    end

    resource :favorites, only: [:create, :delete] do
      put :add
      get :count
    end
  end
end
