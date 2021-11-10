Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index,:new, :create]
        # member do
        #   get ''
        # end
  end  
  # member do
  #   get 'order', to: 'items#order'
  # end
  
end
