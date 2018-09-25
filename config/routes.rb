Rails.application.routes.draw do
  resources :sendgrid_events, only: :create
end
