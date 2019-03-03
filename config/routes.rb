Rails.application.routes.draw do
  devise_for :users, :path => 'accounts', :controllers => { registrations: 'registrations' }
  resources :users do
    resources :books, only: [:index, :show, :new, :create, :edit]
    end

  resources :categories

  resources :books do
    resources :chapters, only: [:index, :show, :new, :create, :edit]
  end
  resources :chapters
  resources :comments
  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#home'
end
