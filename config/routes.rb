Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  resources :users do
    resources :books
    end

  resources :categories
  resources :books do
    resources :chapters
  end
  
  resources :chapters

  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#home'
end
