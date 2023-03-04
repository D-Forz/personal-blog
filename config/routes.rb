Rails.application.routes.draw do
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about'
  get '/projects', to: 'pages#projects'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts
end
