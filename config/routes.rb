Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "dashboard", to: 'pages#dashboard'
end
