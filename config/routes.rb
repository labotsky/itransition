Itra::Application.routes.draw do
  scope ":locale", locale: /en|ru/ do
    root to: 'static_pages#home'
    resources :paragraphs, except: [:index]
    resources :categories, only: [:show]
    resources :poems do
      get 'like', on: :member
    end
    devise_for :users
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
    get "static_pages/home"
    get "static_pages/theme" 
    get "static_pages/search"
    get 'tags/:tag', to: 'poems#index', as: :tag   
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}") 
  match '', to: redirect("/#{I18n.default_locale}") 
end
