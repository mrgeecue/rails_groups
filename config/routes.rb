Rails.application.routes.draw do
  resources :users, :organizations
  root 'sessions#index'
  get '/main' => 'sessions#index'
  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  post '/members' => 'members#create'
  delete '/members' => 'members#destroy'
  # get '/organizations' => "organizations#index"
  # post '/organizations' => 'organizations#create'
  # get '/organizations/:id' => 'organizations#show'
  # delete '/organizations/:id' => 'organizations#destroy'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
