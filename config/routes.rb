Duo::Application.routes.draw do
 # Root
   root to: 'sessions#index'

 # Users
   resources :users
   match '/users/build', to: 'users#build'

 # Teams
   resources :teams

 # Sessions
   resources :sessions
   match '/signup',  to: 'users#new'
   match '/signin',  to: 'sessions#new'
   match '/signout', to: 'sessions#destroy', via: :delete
end