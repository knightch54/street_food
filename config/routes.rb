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
  resources :food_ingredients
  resources :ingredients

  get '/dishes', to: 'main#dishes'
  get '/contact', to: 'main#contact'
  get '/orders/open_order/:id', to: 'orders#open_order'

  # resources :foods, :path => "dishes"
  # get '/orders', to: 'orders#index'

  resources :chefs do
    resources :orders
  end

  resources :foods do
    resources :food_ingredients
  end

  get 'popular_food', to: 'foods#popular_food'
  get 'food_order/:id', to: 'foods#food_order', as: :food_order
  post 'add_food_to_cart/:id', to: 'orders#add_food_to_cart', as: :add_food_to_cart
  get 'show_shopping_cart', to: 'orders#show_shopping_cart'
  post 'create_order', to: 'orders#create'
  
  root 'main#index'
end
