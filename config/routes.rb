Rails.application.routes.draw do
  namespace :admin do
    resources :movies, only: [:create, :update]
    get '/movies/', to: "movies#index"
    get '/movies/:id/edit', to: "movies#edit"
  end
  get "/movies", to: "movies#index"
end
