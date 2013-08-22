Itra::Application.routes.draw do
  resources :paragraphs, except: [:index]
  resources :categories, except: [:index]
  resources :poems do
    get 'like', on: :member
  end
  devise_for :users
  get "static_pages/home"
  get "static_pages/theme"
  root to: 'static_pages#home'
end
