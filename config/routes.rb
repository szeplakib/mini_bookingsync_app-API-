Rails.application.routes.draw do
  resources :rentals do
    resources :bookings
  end
  get '/bookings', to: 'bookings#index_all'
end
