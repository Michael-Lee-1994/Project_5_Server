Rails.application.routes.draw do
  resources :user_shows
  resources :users
  resources :animes
  resources :tv_shows
  resources :movies
  resources :reviews

  post "/login", to: "users#login"
  get "/getuser", to: "users#getuser"
  post "/newshow", to: "users#newshow"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
