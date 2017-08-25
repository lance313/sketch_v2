Rails.application.routes.draw do
  get '/', to: 'sessions#new'

  get 'user/new'

  # get 'sessions/login'

  get 'sessions/pieces'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'logout', to: 'sessions#destroy'

  get  '/signup',  to: 'users#new'
  get  '/pieces', to: 'pieces#index'

  post '/sessions/login', to: 'sessions#login_attempt'
  # to: 'pieces#index'

  resources :users


  resources :comments

  resources :pieces do
    resources :comments
  end


  get '/comments' => 'pieces#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
