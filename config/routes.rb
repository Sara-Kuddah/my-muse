Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'artists#index'
  resources :artists, :songs

  get "about", to: "application#about"
  post "artists", to: "artists#create"
  get "artists", to: "artists#index"
  get "artists/new", to: "artists#new"
  delete "artists/:id", to: "artists#destroy"
  patch "artists/:id", to: "artists#update"
  get "artists/:id/edit", to: "artists#edit", as: :artist_edit
  post "songs", to: "songs#create"
  get "songs/new", to: "songs#new"
  # get "artists/:id", to: "artists#show", as: :artist
  
  get "bootstrap", to: "artists#bootstrap"
end
