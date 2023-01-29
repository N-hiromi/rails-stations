Rails.application.routes.draw do
  get 'sheets/index'
  namespace :admin do
    resources :movies, only: [:create, :update, :destroy]
    get '/movies/', to: "movies#index"
    get '/movies/:id/', to: "movies#edit"
    resources :schedules, only: [:create, :update, :destroy]
    get '/schedules/', to: "schedules#index"
    get '/schedules/:id/', to: "schedules#edit"
    get '/movies/:id/schedules/new', to: "schedules#new"
  end
  get "/movies", to: "movies#index"
  get "/sheets", to: "sheets#index"

  resources :reservations, only: [:create, :update, :destroy]
  resources :movies do
    member do
      get 'reservation'
    end 
  end
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: "reservations#new"
end
