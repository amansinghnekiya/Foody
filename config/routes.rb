Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'restaurants#index'
  resources :restaurants do
    resources :items
  end

  post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"
  resources :order_items
  resources :carts
  resources :orders


  
end
