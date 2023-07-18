Rails.application.routes.draw do
  root 'stores#home'
  resources :restaurants do
    resources :items
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
