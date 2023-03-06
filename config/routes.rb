Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  resources :flats do
    resources :bookings, only: %i[new create]
    resources :flat_amenities, only: %i[index new create]
    resources :rooms, only: %i[new create show] do
      resources :beds, only: %i[new create]
    end
  end
  resources :bookings, only: %i[index show edit update] do
    resources :reviews, only: %i[new create]
  end
  resources :bookmarks, only: %i[index create destroy]
  resources :flat_amenities, only: %i[destroy]
  resources :rooms, only: %i[destroy]
  resources :reviews, only: %i[destroy]
end
