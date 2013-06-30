Duo::Application.routes.draw do
 # Root
   root to: 'users#index'

 # Users + Teams + People
   resources :users do
     resources :teams, :only => [:create, :destroy]
     resources :people, :only => [:create, :destroy]
   end

 # Sessions
   get '/sessions/new', to: 'sessions#new', as: :login
   post '/sessions', to: 'sessions#create'
   delete '/sessions/:id', to: 'sessions#destroy', as: :logout
   # resources :sessions, :only => [:create, :destroy]
   # match '/logout', :to => 'sessions#destroy'
   # match '/login', :to => 'sessions#new'
end