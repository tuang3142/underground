Rails.application.routes.draw do
  root "microposts#index"

  get "signup", to: "users#new"
  get "login",  to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :users, only: %i[new create]
  resources :microposts, only: %i[new create index] do
    resources :likes, only: %i[create destroy]
  end
end
