 Rails.application.routes.draw do

  root 'users#index'
  get 'main' => 'users#index'

  get 'users/index'
  get 'users/:id' => 'users#show'
  post 'users' => 'users#create'


  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'
  #somethig
  get 'songs' => 'songs#index'
  post 'songs' => 'songs#create'
  get 'songs/:id' => 'songs#show'

  post 'adds/:id' => 'songs#add'



end
