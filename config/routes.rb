Rails.application.routes.draw do
  resources :users
   # resources :users
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # get '/users/:id' => 'users#show'
   # post '/users' => 'users#create'
   
   # namespace :api do
      # namespace :v1 do
         # resources :games
         resources :users, only: [:create, :index]
         resources :games, only: [:create, :index, :show, :update]
         post '/login', to: 'auth#create' #needs the username and password
         get '/profile', to: 'users#show' #take in the token
      # end
   # end
end
