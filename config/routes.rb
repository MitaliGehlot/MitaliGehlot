Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "shop#index"
get "/shop",to: "shop#index"
get "/shop/:id",to: "shop#show"
resources :categories do
  resources :products
end
end