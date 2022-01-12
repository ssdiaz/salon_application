Rails.application.routes.draw do
  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'

  get '/auth/:google_oauth2/callback' => 'sessions#google'

  resources :users
  resources :services
  resources :appointments

  resources :clients do 
    resources :appointments, only: [:show, :index, :new] 
  end

  resources :stylists do 
    resources :services, only: [:show, :index] 
    resources :appointments, only: [:show, :index, :new] 
  end
  
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html