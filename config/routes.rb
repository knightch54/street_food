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

  resources :food_additional_ingredients

  get 'profile', to: 'users#profile'

  # User.roles.keys.each do |role|
  #   scope role, as: role do
  #     resources :users, only: [:index]
  #   end
  # end
  get 'cash_balances/cash_balance_history', to: 'cash_balances#cash_balance_history' 
  post 'cash_balances/close_cashbox/:id', to: 'cash_balances#close_cashbox', as: :cash_balances_close_cashbox
  resources :cash_balances

  resources :users

  post 'add_food_to_cart/:id', to: 'orders#add_food_to_cart', as: :add_food_to_cart
  get 'show_shopping_cart', to: 'orders#show_shopping_cart'
  post 'create_order', to: 'orders#create'
  post 'orders/chef_update_order/:id', to: 'orders#chef_update_order', as: :orders_chef_update_order
  get 'orders/completed_list', to: 'orders#completed_list', as: :orders_completed_list
  resources :orders

  resources :managers

  get 'popular_food', to: 'foods#popular_food'
  get 'food_order/:id', to: 'foods#food_order', as: :food_order
  resources :foods

  resources :food_ingredients
  
  resources :ingredients

  get '/dishes', to: 'main#dishes'
  get '/contact', to: 'main#contact'
  get '/orders/open_order/:id', to: 'orders#open_order'

  resources :chefs do
    resources :orders
  end

  resources :foods do
    resources :food_ingredients
  end

  resources :foods do
    resources :food_additional_ingredients
  end
  
  root 'main#index'
end
