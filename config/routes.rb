Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  resources :flats do
    resources :bookings, only: %i[new create]
    resources :flat_amenities, only: %i[index new create delete]
  end
  resources :bookings, only: %i[index show edit update]
  resources :bookmarks, only: %i[index create]
end
