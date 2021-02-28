Rails.application.routes.draw do
  root 'static_pages#top'
  get 'users/new'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  resources :users
  get '/healthcheck' => lambda { |env| [200, { 'Content-Type' => 'text/plain' }, ['Healthy']] }
  get '/login', to: 'session#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
