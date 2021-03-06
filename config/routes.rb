Rails.application.routes.draw do
  devise_for :users
  root to: 'games#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [ :new, :create, :show, :update ] do
    resources :clues, only: :create
    resources :messages, only: :create
  end
end
