Rails.application.routes.draw do
  root 'home#index'
  get '/', to: "home#index"
  post '/home', to: "home#show"
end
