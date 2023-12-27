Rails.application.routes.draw do
  resources :members
  resources :tenants
  devise_for :users
  root "pages#home"
  get "dashboard", to: 'pages#dashboard'
end
