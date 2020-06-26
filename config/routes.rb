Rails.application.routes.draw do
  root 'stories#index'

  get '/stories/:slug' => 'stories#show'


  get '/result' => 'stories#result'
  post '/stories/complete' => 'stories#storied', as: "complete"

  resources :stories
end
