Itra::Application.routes.draw do
  devise_for :users
  get "static_pages/home"
  root to: 'static_pages#home'
end
