Rails.application.routes.draw do
  resources :category_products
  resources :categories
  resources :products
  get '/home', to: 'home#index'
  post '/home', to: 'home#index'
  get '/help', to: 'home#help'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
