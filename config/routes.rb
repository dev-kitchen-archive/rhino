Rails.application.routes.draw do
  resources :users, except: %i(show)
  resources :media
  root 'media#index'
end
