Rails.application.routes.draw do
  root 'pages#home'

  namespace :subscriptions do
    post :add
    get :remove
  end
end
