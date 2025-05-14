Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :assets
  resources :users
  root 'health#check'
  namespace :api do
    namespace :v1 do
      resources :auth, only: [:create]
      resources :users, only: [] do
        collection do
          get :me
        end
      end
    end
  end
end
