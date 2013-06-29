Duo::Application.routes.draw do
 # Root
   root to: 'team_path'

 # User
   resources :users

 # Team
   resources :teams

 # Person
   resources :people

 # Sessions
   resources :sessions, :only => :create
   match '/logout', :to => 'sessions#destroy'
   match '/login', :to => 'sessions#new'
end