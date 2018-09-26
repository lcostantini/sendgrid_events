Rails.application.routes.draw do
  resources :sendgrid_events, only: [:create, :index, :show]

  root 'sendgrid_events#index'
end
