Rails.application.routes.draw do
  resources :tenants do
    resources :members do
      collection do
        post :invite
      end
    end
  end
  devise_for :users
  root "pages#home"
  get "dashboard", to: 'pages#dashboard'
end
