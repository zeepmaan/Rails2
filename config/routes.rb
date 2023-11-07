Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  root to: 'users#index'
  get 'users/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [:show] do
    collection do
      get 'search'
      get 'account'
      get 'profile'
    end
  end

  resources :rooms
  resources :reservations do
    collection do
    post 'confirm'
    end
  end
end

