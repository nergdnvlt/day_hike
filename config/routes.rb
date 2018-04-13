Rails.application.routes.draw do
  resources :trips, only: %i[index show]
  resources :trails, only: %i[show]
end
