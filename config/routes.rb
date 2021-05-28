Rails.application.routes.draw do
  resources :tag_products
  resources :tags
  resources :size_products
  resources :sizes
  resources :color_products
  resources :colors
  resources :subimgs
  resources :category_products
  resources :users

  resources :categories do
    collection do
      post 'saved_from_category'
    end
  end

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
  get '/search', to: 'home#search'
  post '/search', to: 'home#search'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
