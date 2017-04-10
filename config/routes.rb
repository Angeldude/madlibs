Rails.application.routes.draw do
  root 'stories#index'

  get '/stories/:slug' => 'stories#show'

  resources :stories
end
