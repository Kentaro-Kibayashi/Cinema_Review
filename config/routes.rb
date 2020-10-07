Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :reviews do
    resource :favorites, only: [:create, :destroy]
  end
end
