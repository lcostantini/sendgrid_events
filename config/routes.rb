Rails.application.routes.draw do
  resources :sendgrid_events, only: [:create, :index]

  root 'sendgrid_events#index'
end
