Rails.application.routes.draw do

  root 'pages#home'

  resources :reviews, only: [:new, :create]

  namespace :subscriptions do
    post :create
    get :remove
  end

  namespace :pages, path: '/' do
    get :blog
    get :our_products
    get :about
  end

  get 'cart' => 'carts#show'
  get 'categories/:slug' => 'categories#show', as: 'category'
  get 'products/:id' => 'products#show', as: 'product'
  get 'posts/:id' => 'posts#show', as: 'post'

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
