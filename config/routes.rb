Rails.application.routes.draw do
  resources :category_products
  resources :categories
  resources :products

  resources :home do
    collection do
      post 'send_email'
      post 'reset_product'
      post 'add_to_list'
      post 'saved_to_list'
      post 'saved_from_collection'
    end
  end

  get '/home', to: 'home#index'
  post '/home', to: 'home#index'
  get '/help', to: 'home#help'
  get '/saved', to: 'home#saved'
  get '/collections', to: 'home#collection_all'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
