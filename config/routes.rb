Rails.application.routes.draw do

  root 'welcomes#index'

  resources :users do
    collection do
      post 'sign_in'
    end
  end
  resources :teams
  resources :photos, only: [:new, :create, :index, :destroy]

  post 'login', to: 'sessions#create', as: :login

  namespace :admin do
    resources :users
    resources :teams do
      collection do
        get 'table'
      end
    end
    resources :battle do

    end
  end

end
