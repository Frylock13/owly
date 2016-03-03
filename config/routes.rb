Rails.application.routes.draw do

  resources :favorites
  root 'pages#home'

  resources :reviews, only: [:new, :create]
  resource :favorites, only: [:index, :destroy]

  namespace :subscriptions do
    post :create
    get :remove
  end

  namespace :pages, path: '/' do
    get :blog
    get :our_products
    get :about
    get :how_to
  end

  #get 'cart' => 'carts#show'
  get 'categories/:slug' => 'categories#show', as: 'category'
  get 'products/:id' => 'products#show', as: 'product'
  get 'posts/:id' => 'posts#show', as: 'post'


  scope :cart do
    get '/' => 'carts#show', as: 'cart'
    put ':product_id/increment' => 'carts#increment', as: 'increment'
    put ':product_id/decrement' => 'carts#decrement', as: 'decrement'
    patch ':product_id/set_count' => 'carts#set_count', as: 'set_count'
    delete ':product_id/delete' => 'carts#delete', as: 'product_delete'
  end

  resources :orders, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    scope :cart do
      get 'count', to: 'carts#count'
      put 'add', to: 'carts#add'
      put 'remove', to: 'carts#remove'
    end

    resource :favorites, only: [:create, :delete] do
      put :add
      get :count
    end
  end

end
