Itra::Application.routes.draw do
  resources :paragraphs, except: [:index]
  resources :categories, except: [:index]
  resources :poems
  devise_for :users
  get "static_pages/home"
  get "static_pages/theme"
  root to: 'static_pages#home'
end
