Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  resources :flats do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit update]
  resources :bookmarks, only: %i[index create destroy]
end
