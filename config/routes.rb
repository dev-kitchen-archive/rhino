Rails.application.routes.draw do
  resources :users
  resources :media
  root 'media#index'
end
