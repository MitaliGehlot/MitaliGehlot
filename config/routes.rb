Rails.application.routes.draw do
  get 'pages/info'
  devise_for :users, :controllers => {:registrations => "registrations"}

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
   get 'my_orders', to: 'orders#my_orders'
end