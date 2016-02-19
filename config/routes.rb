Rails.application.routes.draw do
  resources :books
  resources :users, except: %i(show)
  resources :media
  root 'media#index'
end
