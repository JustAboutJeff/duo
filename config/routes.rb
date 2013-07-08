Duo::Application.routes.draw do
 # Sessions
   get '/signup',  to: 'users#new'
   get '/signin',  to: 'sessions#new'
   delete '/signout', to: 'sessions#destroy'

 # Root
   root to: 'sessions#index'

 # Users
   resources :users do
     post :build, on: :collection
   end

 # Teams
   resources :teams
   post '/teams/:id/repopulate', to: 'teams#repopulate', as: :repopulate_team
end

