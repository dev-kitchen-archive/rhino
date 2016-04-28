Rails.application.routes.draw do
  scope '/:locale', locale: /en|de/ do
    resources :books do
      resources :chapters, except: %i(show), shallow: true
    end
    resources :users, except: %i(show)
    resources :media
  end
  root 'media#index', locale: 'en'
end
