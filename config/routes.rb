Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  resources :users do
    resources :books do
      resources :chapters
    end
  end
  resources :categories
  resources :books
  resources :chapters
  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#home'
end
