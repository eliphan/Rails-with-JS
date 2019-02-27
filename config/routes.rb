Rails.application.routes.draw do
  devise_for :users
  get '/auth/facebook/callback' => 'sessions#create'

end
