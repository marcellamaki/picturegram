Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, :pictures, :tags, :picture_tags, :comments
resources :sessions, only: [:show, :destroy]

get '/session/new', to: 'sessions#new', as: 'signin'
post '/session/new', to: 'sessions#create'
get '/signup', to: 'users#new', as: 'signup'
delete '/logout', to: 'sessions#destroy'

get '/', to: 'home_page#show', as: 'home'

end
