Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  # create routes for users, except :new, because :signup created above
  resources :users, except: [:new]
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
end
