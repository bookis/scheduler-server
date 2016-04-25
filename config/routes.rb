Rails.application.routes.draw do
  resources :emails
  post "/emails/:email_id/schedules", to: "schedules#create"
  get "/emails/:email_id/schedules",  to: "schedules#index", as: :email_schedules
  get "/auth/google_oauth2/new",      to: "session#new"
  get "/auth/google_oauth2/callback", to: "session#create"
  get "/sign-out", to: "session#destroy"
  get "/users/me", to: "users#show", as: :user
end
