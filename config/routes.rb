Duo::Application.routes.draw do
 # Root
   root to: 'sessions#index'

 # Users
   resources :users

 # Teams
   resources :teams

 # Sessions
   resources :sessions
   match '/signup',   to: 'users#new'
   match '/signin',  to: 'sessions#new'
   match '/signout', to: 'sessions#destroy', via: :delete
end