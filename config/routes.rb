Rails.application.routes.draw do
  
  # resources :appointments
  # resources :schedules
  # resources :services
  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'


  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy' #delete, and post do not work here ... 
  # post '/logout' => 'sessions#destroy'

  resources :users
  resources :clients
  resources :stylists do 
    resources :services, only: [:show, :index] 
    resources :appointments, only: [:show, :index, :new] 
  end
  resources :services, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :appointments
  resources :schedules

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
