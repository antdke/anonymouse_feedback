Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"
  
  # HTTP verb > route > controller > action (method in a controller)
  get 'search', to: 'pages#search'
  post 'search', to: 'pages#search'

  post 'feedbacks', to: 'pages#search' #TEMP
end
