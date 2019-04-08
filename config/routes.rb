Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index]
  end

  get 'admins', to: 'admins#home'
  get 'admins/index', to: 'admins#index'

  devise_for :users, :path => 'accounts', :controllers => { registrations: 'registrations' ,  omniauth_callbacks: 'omniauth_callbacks'}
  
  resources :users do
    resources :books, only: [:index, :show, :new, :create, :edit]
    end
  
  resources :categories
  resources :reviews  
  
  resources :books do 
    resources :reviews
  end

  resources :books do
    resources :chapters, only: [:index, :show, :new, :create, :edit]
  end


  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#home'
end
