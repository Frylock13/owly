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

  #get 'cart' => 'carts#show'
  get 'categories/:slug' => 'categories#show', as: 'category'
  get 'products/:id' => 'products#show', as: 'product'
  get 'posts/:id' => 'posts#show', as: 'post'


  scope :cart do
    get '/' => 'carts#show', as: 'cart'
    put ':product_id/increment' => 'carts#increment', as: 'increment'
    put ':product_id/decrement' => 'carts#decrement', as: 'decrement'
    put ':product_id/set_count' => 'carts#set_count', as: 'set_count'
  end

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
