Rails.application.routes.draw do
  namespace :api do
    resources :ponude, only: [:index, :create]
    post 'auth/register', to: 'auth#register'
    post 'auth/login', to: 'auth#login'
  end
end