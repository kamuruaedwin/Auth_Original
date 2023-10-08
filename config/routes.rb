Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"


resources :sessions
resources :registrations
resources :password_resets
resources :passwords

delete 'logout' => 'sessions#destroy', as: :logout

post '/data/receive_data', to: 'data#receive_data'

# get 'bets/new'
resources :bets, only: [:new, :create]

get 'deposits/new'
get 'deposits/create'
resources :deposits, only: [:new, :create]

get 'withdraws/new'
resources :withdraws, only: [:new, :create]

resources :messages, only: [:index, :create]

root "main#index"

end