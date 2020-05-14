Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'products/index'
  get 'carts/:id/add', to: 'carts#add', as: 'add_cart'
  get 'carts/index', to: 'carts#index'
  get 'carts/:id/delete', to: 'carts#delete', as: 'delete_cart'
  get 'carts/destroy', to: 'carts#destroy', as: 'destroy_carts'
  put 'carts/:id/inc', to: 'carts#increment_item', as: 'increment_item'
  put 'carts/:id/dec', to: 'carts#decrement_item', as: 'decrement_item'
  root 'products#index'
end
