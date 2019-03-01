Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :books, only: [:index, :show, :new, :create, :edit]
  end
  resources :categories
  resources :books

  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#home'
end
