Rails.application.routes.draw do
  get 'user/new'

  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get  '/signup',  to: 'user#new'


  resources :comments

  resources :pieces do
    resources :comments
  end

  root 'pieces#index'

  get '/comments' => 'pieces#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
