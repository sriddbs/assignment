Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'contents', to: 'contents#index'
      resources :users do
        resources :libraries
      end
      resources :movies
      resources :seasons
      resources :purchases
    end
  end
end
