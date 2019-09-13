Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#show'
  post 'dashboard/message' => 'dashboard#message'
  get 'home/show'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'
  root 'home#show'
end
