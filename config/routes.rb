Rails.application.routes.draw do
  get 'feedbacks/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"
  
  # HTTP verb > route > controller > action (method in a controller)
  post 'feedbacks', to: 'feedbacks#create'
  post '/', to: 'pages#home'
end
