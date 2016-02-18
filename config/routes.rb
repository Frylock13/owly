Rails.application.routes.draw do
  root 'pages#home'

  namespace :subscriptions do
    post :create
    get :remove
  end
end
