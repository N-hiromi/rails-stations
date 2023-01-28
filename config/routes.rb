Rails.application.routes.draw do
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: [:create, :update, :destroy]
    get '/movies/', to: "movies#index"
    get '/movies/:id/edit', to: "movies#edit"
  end
  get "/movies", to: "movies#index"
  resources :movies, only: [:show, :update, :destroy]
  get "/sheets", to: "sheets#index"
end
