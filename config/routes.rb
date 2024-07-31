# config/routes.rb
Rails.application.routes.draw do
  root 'horses#index'
  resources :stables
  resources :horses, except: [:show]
end
