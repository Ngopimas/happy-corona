Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :users
  get "/category/:category" => "events#search", as: :search_category
  get "/search" => "events#search"
  patch "events/:id", to: "events#update"
end
