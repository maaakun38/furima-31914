Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, except: :index
  resources :products do
    resources :purchases, only: [:index, :create]
  end
end
