Rails.application.routes.draw do
  namespace :admin do
    resources :movies
    get '/movies/', to: "movies#index"
  end
  get "/movies", to: "movies#index"
end
