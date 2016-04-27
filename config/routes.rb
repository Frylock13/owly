Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'# if Rails.env == 'development'

  match '*any' => 'application#options', :via => [:options]

  root 'pages#home'

  get '/robots.txt' => 'pages#robots'

  resources :reviews, only: [:new, :create]
  resources :favorites, only: [:index, :destroy]
  resources :orders, only: [:new, :create] do
    get :invoice
  end
  resources :questions
  resources :products, only: :show
  resources :posts, only: :show
  resources :categories, only: :show

  namespace :subscriptions do
    post :create
    get :remove
  end

  namespace :pages, path: '/' do
    get :blog
    get :our_products
    get :about
    get :how_to
    get :contacts
    get :search
    get :warranty
    post :search
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

  scope :cart do
    get '/' => 'carts#show', as: 'cart'
    put ':product_id/increment' => 'carts#increment', as: 'increment'
    put ':product_id/decrement' => 'carts#decrement', as: 'decrement'
    patch ':product_id/set_count' => 'carts#set_count', as: 'set_count'
    delete ':product_id/delete' => 'carts#delete', as: 'product_delete'
  end
end
