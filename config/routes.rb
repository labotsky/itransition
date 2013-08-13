Itra::Application.routes.draw do
  get "static_pages/home"
  root to: 'static_pages#home'
  match '/signin', to: 'static_pages#signin'
  match '/signup', to: 'static_pages#signup'
end
