Rails.application.routes.draw do
  resources :books do
    resources :chapters, except: %i(index show), shallow: true
  end
  resources :users, except: %i(show)
  resources :media
  root 'media#index'
end
