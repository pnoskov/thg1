Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
# config/routes.rb
Rails.application.routes.draw do
    get '/current_time', to: 'current_time#current_time'
end
