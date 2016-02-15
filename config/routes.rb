Rails.application.routes.draw do
  resources :media
  root 'media#index'
end
