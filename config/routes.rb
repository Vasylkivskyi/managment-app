Rails.application.routes.draw do
  root "pages#home"
  get "dashboard", to: 'pages#dashboard'
end
