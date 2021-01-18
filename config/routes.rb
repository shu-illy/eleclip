Rails.application.routes.draw do
  root 'static_pages#top'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'
end
