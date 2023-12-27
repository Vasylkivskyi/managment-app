Rails.application.routes.draw do
  resources :tenants
  devise_for :users
  root "pages#home"
  get "dashboard", to: 'pages#dashboard'
end
