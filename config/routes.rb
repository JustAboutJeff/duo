Duo::Application.routes.draw do
 # Root
   root to: 'users#index'

 # Users + Teams
   resources :users do
     resouces :teams
   end

 # People
   resources :people

 # Sessions
   resources :sessions, :only => :create
   match '/logout', :to => 'sessions#destroy'
   match '/login', :to => 'sessions#new'
end