Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
delete '/users/:id', to: 'users#destroy'

resources :users, :tags, :picture_tags, :likes
resources :sessions, only: [:show, :destroy]

resources :pictures do
  resources :comments
end



get '/session/new', to: 'sessions#new', as: 'signin'
post '/session/new', to: 'sessions#create'
get '/signup', to: 'users#new', as: 'signup'
get '/logout', to: 'sessions#destroy'
delete '/tags/:id', to: 'tags#destroy'

get '/', to: 'home_page#show', as: 'home'

end
