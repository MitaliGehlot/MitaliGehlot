Rails.application.routes.draw do
  get 'pages/info'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "categories#index"


  resources :categories do
    resources :products do 
    # resources :orders
    end
  end
   resources :products do 
    resources :orders
    end
   resources :customers
  resources :payment
  resources :card
end