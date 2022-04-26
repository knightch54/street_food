Rails.application.routes.draw do
  apipie
  devise_for :users, path: '', path_names: { 
    sign_in: 'login', 
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock', 
    registration: '',
    sign_up: 'register' 
  }

  # get 'orders/index'
  # get 'orders/show'

  resources :users
  resources :orders
  # resources :chefs
  resources :foods, except: %i[index]

  get '/dishes', to: 'foods#index'
  # get '/orders', to: 'orders#index'

  resources :chefs do
    resources :orders
  end

  root 'main#index'
end
