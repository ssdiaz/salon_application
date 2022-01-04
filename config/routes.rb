Rails.application.routes.draw do


  
  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'

  # get 'signup', to: 'users#new'#signup

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get 'logout', to: 'sessions#destroy'
  # delete 'logout', to: 'sessions#destroy'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy' #delete, and post do not work here ... 
  # post '/logout' => 'sessions#destroy'

  resources :users
  # resources :clients

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # https://3rd-edition.railstutorial.org/book/log_in_log_out#sec-sessions_and_failed_login
    # root                'static_pages#home'
    # get    'help'    => 'static_pages#help'
    # get    'about'   => 'static_pages#about'
    # get    'contact' => 'static_pages#contact'
    # get    'signup'  => 'users#new'
    # get    'login'   => 'sessions#new'
    # post   'login'   => 'sessions#create'
    # delete 'logout'  => 'sessions#destroy'
    # resources :users
