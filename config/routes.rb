Rails.application.routes.draw do
  get 'pages/info'
  devise_for :users, :controllers => {:registrations => "registrations"}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "categories#index"
  get 'search', to: 'products#search'
  get 'categories_search', to: 'categories#search'
  get 'products/:id', to: 'products#downloadpdf'

  resources :categories do
    resources :products do 
      get :download_pdf, on: :member
    # resources :orders
    end
  end
   resources :products do 
    resources :orders
    end
   resources :customers
   get 'my_orders', to: 'orders#my_orders'
   get 'export', to: "orders#export" 
   get 'user_orders', to: 'orders#user_orders'

end