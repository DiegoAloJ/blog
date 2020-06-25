Rails.application.routes.draw do
  resources :categories
  resources :articles
  root "articles#index"
  get "welcome/contacto"
end
