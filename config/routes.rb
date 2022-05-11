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
  resources :managers
  # resources :chefs
  # resources :foods, except: %i[index]
  resources :foods

  get '/dishes', to: 'main#dishes'
  get '/contact', to: 'main#contact'

  # resources :foods, :path => "dishes"
  # get '/orders', to: 'orders#index'

  resources :chefs do
    resources :orders
  end

  root 'main#index'
end
