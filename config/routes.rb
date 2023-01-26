Rails.application.routes.draw do
  namespace :admin do
    get 'movies/', to: "movies#index"
  end
  get "/movies", to: "movies#index"
end
