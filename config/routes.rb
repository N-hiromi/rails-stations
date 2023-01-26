Rails.application.routes.draw do
  namespace :admin do
    resources :movies, only: [:index, :new, :create]
    get '/movies/', to: "movies#index"
  end
  get "/movies", to: "movies#index"
end
