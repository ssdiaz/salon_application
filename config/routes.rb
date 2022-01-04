Rails.application.routes.draw do
  resources :users
  resources :clients

  
  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'

  get 'signup', to: 'users#signup'#clients???????????

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'



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
