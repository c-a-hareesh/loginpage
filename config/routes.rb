Rails.application.routes.draw do
  get 'auth/login'
  post 'auth/login_auth'
  get 'auth/signup'
  post 'auth/create'
  get 'auth/dashboard'
  root 'auth#signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
