Rails.application.routes.draw do
  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy' #delete, and post do not work here ... # post '/logout' => 'sessions#destroy'

  resources :users
  resources :clients
  resources :stylists do 
    resources :services, only: [:show, :index] 
    resources :appointments, only: [:show, :index, :new] 
  end
  resources :services
  resources :appointments

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html