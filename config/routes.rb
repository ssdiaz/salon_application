Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'static#home'

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'
  get 'signup', to: 'static#signup'
  get 'login', to: 'static#login'

end
