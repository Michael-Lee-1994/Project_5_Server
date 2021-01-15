Rails.application.routes.draw do
  resources :user_shows
  resources :users
  resources :animes
  resources :tv_shows
  resources :movies
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
