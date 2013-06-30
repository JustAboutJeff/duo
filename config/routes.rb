Duo::Application.routes.draw do
 # Root
   root to: 'users#index'

 # Users + Teams + People
   resources :users do
     resources :teams
     resources :people
   end

 # Sessions
   resources :sessions, :only => :create
   match '/logout', :to => 'sessions#destroy'
   match '/login', :to => 'sessions#new'
end