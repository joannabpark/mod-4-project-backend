Rails.application.routes.draw do
  resources :notes
  resources :users

    post '/users/login', to: 'users#login'
    get '/user', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# http://localhost:3000/users/login