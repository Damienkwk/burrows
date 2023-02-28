Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  resources :flats
  resources :bookings, only: %i[index show]
  resources :bookmarks, only: [:index, :create]
end
